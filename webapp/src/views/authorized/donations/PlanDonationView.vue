<script setup>
import Datepicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

import UISelectorButton from '@/components/ui/UISelectorButton.vue';
import UIDropdownWithSearch from '@/components/ui/UIDropdownWithSearch.vue';
</script>
<template>
    <div class="p-3 text-lg">
        <div class="p-3 text-center">
            <b class="text-3xl">Напоминание о донации</b>
        </div>
        <div class="text-center pt-6">
            <b>Выберите тип донации</b><br>
            <span>После выбора типа донации автоматически отобразится ближайшая доступная дата с учётом интервалов между донациями</span><br>
            <UIDropdownWithSearch :options="donations" v-model="donationType"/>
        </div>
        <div class="text-center pt-6">
            <b>Дата донации</b><br>
            <Datepicker v-model="date"
            locale="ru-RU"
            :enable-time-picker="false"
            class="p-3"
            :min-date="new Date()"
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
            <span>Важно: если ваш центр крови принимает по записи, то нужно отдельно записаться на сайте центра крови или через Госуслуги. Планирование донации на сайте DonorSearch позволит нам за 3 дня до указанной даты напомнить о вашем намерении совершить донацию и подготовиться к ней.</span><br>
            <UIDropdownWithSearch :options="centers" v-model="center">
                Выберите центр крови
            </UIDropdownWithSearch>
            <b>Планирование не означает запись на донацию в центр крови</b>
        </div>
    </div>
</template>

<script>
import { RegionService } from '@/services/RegionService';
import { StationService } from '@/services/StationService';
export default {
    name: 'CreateDonationView',
    data() {
        return {
            date: new Date(),

            donationType: 0,
            donations: {
                0: 'Цельная кровь',
                1: 'Плазма',
                2: 'Тромбоциты',
                3: 'Эритроциты',
                4: 'Гранулоциты'
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
        updateCenters() {
            StationService.getStations(this.city, (data) => {
                this.centers = data.results.reduce((acc, cur) => {
                    acc[cur.id] = cur.title;
                    return acc;
                }, {})
            }, () => {
                this.$notify({text: "Не удалось получить доступные станции", type: "error"});
            })
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