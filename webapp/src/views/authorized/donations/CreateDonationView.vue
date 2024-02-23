<script setup>
import Datepicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

import UISelectorButton from '@/components/ui/UISelectorButton.vue';
import UIDropdownWithSearch from '@/components/ui/UIDropdownWithSearch.vue';
import { MainButton } from 'vue-tg';
</script>
<template>
    <div class="p-3 text-lg">
        <div class="p-3 text-center">
            <b class="text-3xl">Добавление донации</b>
        </div>
        <div class="text-center pt-6">
            <b>Выберите тип донации</b><br>
            <UIDropdownWithSearch :options="donations" v-model="blood_type"/>
        </div>
        <div class="text-center pt-6">
            <b>Дата донации</b><br>
            <Datepicker v-model="date"
            locale="ru-RU"
            :enable-time-picker="false"
            class="p-3"
            :max-date="new Date()"
            format="dd.MM.yyyy"/>
        </div>
        <div class="text-center pt-6">
            <b>Тип донации</b><br>
            <UISelectorButton name="Безвозмездно" @click="selectType(0)" :active="type == 0">
                Питание или компенсация питания (5% МРОТ порядка 700-1500 ₽. Учитывается при получении звания Почетного донора.)
            </UISelectorButton><br>
            <UISelectorButton name="Платно" @click="selectType(1)" :active="type == 1">
                Деньги или социальная поддержка. Не учитывается при получении звания почетного донора
            </UISelectorButton>
        </div>
        <div class="text-center pt-6">
            <b>Место сдачи</b><br>
            <UISelectorButton name="Стационарный пункт" @click="selectPlace(0)" :active="place == 0">
                Центр крови или станция переливания в вашем городе
            </UISelectorButton><br>
            <UISelectorButton name="Выездная акция" @click="selectPlace(1)" :active="place == 1">
                День донора, выезды в ВУЗы, передвижные мобильные бригады
            </UISelectorButton>
        </div>
        <div class="text-center pt-6">
            <b>Город</b><br>
            <UIDropdownWithSearch :options="cities" v-model="city" @changed="updateCenters">
                Выберите город
            </UIDropdownWithSearch>
        </div>
        <div class="text-center pt-6" v-if="place == 0">
            <b>Центр крови</b><br>
            <UIDropdownWithSearch :options="centers" v-model="center">
                Выберите центр крови
            </UIDropdownWithSearch>
        </div>
        <div class="text-center pt-6">
            <b>Справка</b><br>
            <UISelectorButton name="Загрузить сейчас" @click="selectDocument(0)" :active="document == 0">
                Справку выданную в центре крови. Загрузка через телеграм бота.
            </UISelectorButton><br>
            <UISelectorButton name="Загрузить потом" @click="selectDocument(1)" :active="document == 1">
                Справку можно будет загрузить позже. Донация без справки не будет учитываться для пути почетного донора.
            </UISelectorButton>
        </div>
    </div>
    <MainButton @click="sendToBot" text="Создать донацию"></MainButton>
</template>

<script>
import { RegionService } from '@/services/RegionService';
import { StationService } from '@/services/StationService';
import { useWebApp } from 'vue-tg';
export default {
    name: 'CreateDonationView',
    components: {
        MainButton
    },
    data() {
        return {
            date: new Date(),

            blood_type: "blood",
            donations: {
                "blood": 'Цельная кровь',
                "plasma": 'Плазма',
                "platelets": 'Тромбоциты',
                "erythrocytes": 'Эритроциты',
                "leukocytes": 'Гранулоциты'
            },
            type: 0,
            place: 0,
            document: 0,

            cities: {},
            centers: {},
            city: 0,
            center: 0
        }
    },
    methods: {
        selectType(type) {
            this.type = type
        },
        selectPlace(place) {
            this.place = place
        },
        selectDocument(document) {
            this.document = document
        },
        updateCenters() {
            StationService.getStations(this.city, (data) => {
                this.centers = data.results.reduce((acc, cur) => {
                    acc[cur.id] = cur.title;
                    return acc;
                }, {})
            }, () => {
                this.$notify({text: "Не удалось получить доступные станции", type: "error"});
            })
        },
        sendToBot() {
            if(this.city < 1) {
                this.$notify({text: "Выберите город", type: "error"});
                return;
            }
            if(this.place == 0 && this.center < 1) {
                this.$notify({text: "Выберите центр крови", type: "error"});
                return;
            }
            useWebApp().sendData(JSON.stringify(
                {
                    type: "add_donation",
                    data: {
                        date: this.date.toISOString().slice(0, 10),
                        blood_type: this.blood_type,
                        type: this.type,
                        place: this.place,
                        document: this.document,
                        city_id: this.city,
                        center_id: this.center
                    },
                    hash: this.$cookies.get("hash"),
                    id: this.$cookies.get("id")
                }));
        }
    },
    mounted() {
        RegionService.getCities((data) => {
            this.cities = data.results.reduce((acc, cur) => {
                acc[cur.id] = cur.title;
                return acc;
            }, {})
        }, () => {
            this.$notify({text: "Не удалось получить доступные города", type: "error"});
        })
    }
}
</script>