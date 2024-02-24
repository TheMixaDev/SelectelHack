<script setup>
import Datepicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

import UISelectorButton from '@/components/ui/UISelectorButton.vue';
import UIDropdownWithSearch from '@/components/ui/UIDropdownWithSearch.vue';
import { MainButton } from 'vue-tg';
</script>
<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        {{id > 0 ? "Редактирование донации" : "Добавление донации"}}
                    </h1>
                    <div class="space-y-4 md:space-y-6" action="#">
                        <div>
                            <b>Выберите тип донации</b>
                            <UIDropdownWithSearch :options="donations" v-model="blood_type" class="mt-1"/>
                        </div>
                        <div>
                            <b>Дата донации</b>
                            <Datepicker v-model="date"
                            locale="ru-RU"
                            class="mt-1"
                            :enable-time-picker="false"
                            :max-date="new Date()"
                            format="dd.MM.yyyy"/>
                        </div>
                        <div>
                            <b>Тип донации</b>
                            <div class="grid gap-2 mb-6 grid-cols-2">
                                <UISelectorButton
                                    name="Безвозмездно"
                                    @select="selectType(0)"
                                    :active="type == 0"
                                    class="mt-2"
                                    :features="[
                                        'Питание или компенсация питания.',
                                        '5% МРОТ порядка 700-1500 ₽.',
                                        'Учитывается при получении звания Почетного донора.'
                                    ]"/>
                                <UISelectorButton
                                    name="Платно"
                                    @select="selectType(1)"
                                    :active="type == 1"
                                    class="mt-2"
                                    :features="[
                                        'Деньги или социальная поддержка.'
                                    ]"
                                    :debuffs="[
                                        'Не учитывается при получении звания почетного донора.'
                                    ]"/>
                            </div>
                        </div>
                        <div>
                            <b>Место сдачи</b>
                            <div class="grid gap-2 mb-6 grid-cols-2">
                                <UISelectorButton
                                    name="Стационарный пункт"
                                    @select="selectPlace(0)"
                                    :active="place == 0"
                                    class="mt-2"
                                    :features="[
                                        'Центр крови.',
                                        'Станция переливания.'
                                    ]"/>
                                <UISelectorButton
                                    name="Выездная акция"
                                    @select="selectPlace(1)"
                                    :active="place == 1"
                                    class="mt-2"
                                    :features="[
                                        'День донора.',
                                        'Выезды в ВУЗы.',
                                        'Предвижные мобильные бригады.'
                                    ]"/>
                            </div>
                        </div>
                        <div>
                            <b>Город</b>
                            <UIDropdownWithSearch :options="cities" v-model="city" @changed="updateCenters" class="mt-1">
                                Выберите город
                            </UIDropdownWithSearch>
                        </div>
                        <div v-if="place == 0">
                            <b>Центр крови</b>
                            <UIDropdownWithSearch :options="centers" v-model="center" class="mt-1">
                                Выберите центр крови
                            </UIDropdownWithSearch>
                        </div>
                        <div>
                            <b class="block pb-2">Справка</b>
                            <div class="grid gap-2 mb-6 grid-cols-2" v-if="!lock_image">
                                <UISelectorButton
                                    name="Загрузить сейчас"
                                    @select="selectDocument(0)"
                                    :active="document == 0"
                                    class="mt-2"
                                    :features="[
                                        'Справка выданная в центре крови.',
                                        'Загрузка через телеграм бота.'
                                    ]"/>
                                <UISelectorButton
                                    name="Загрузить потом"
                                    @select="selectDocument(1)"
                                    :active="document == 1"
                                    class="mt-2"
                                    :features="[
                                        'Справку можно будет загрузить позже.'
                                    ]"
                                    :debuffs="[
                                        'Донация без справки не будет учитываться для пути почетного донора.'
                                    ]"/>
                            </div>
                            <img v-else :src="image_id" class="w-full my-3 mx-auto rounded-lg no-select">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <MainButton @click="sendToBot" :text="id == -1 ? 'Создать донацию' : 'Сохранить донацию'"></MainButton>
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
            lock_image: false,

            cities: {},
            centers: {},
            city: 0,
            center: 0,
            image_id: -1,

            id: -1
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
            let data = {
                date: this.date.toISOString().slice(0, 10),
                blood_type: this.blood_type,
                type: this.type,
                place: this.place,
                document: this.document,
                city_id: this.city,
                center_id: this.center
            }
            let type = this.id == -1 ? "add_donation" : "update_donation";
            if(this.id != -1) data.id = this.id;
            useWebApp().sendData(JSON.stringify(
                {
                    type: type,
                    data: data,
                    hash: this.$cookies.get("hash"),
                    id: this.$cookies.get("id")
                }));
        }
    },
    mounted() {
        if(localStorage.getItem("donation")) {
            let donation = JSON.parse(localStorage.getItem("donation"));
            this.date = new Date(donation.donate_at);
            this.blood_type = donation.blood_class;
            this.type = donation.payment_type == "free" ? 0 : 1;
            this.place = donation.blood_station_id != 0 ? 0 : 1;
            this.document = donation.with_image ? 0 : 1;
            this.image_id = donation.image_id;
            if(donation.with_image) this.lock_image = true;
            this.city = donation.city_id;
            this.center = donation.blood_station_id;
            this.id = donation.id;
            localStorage.removeItem("donation");
        }
        RegionService.getCities((data) => {
            this.cities = data.results.reduce((acc, cur) => {
                acc[cur.id] = cur.title;
                return acc;
            }, {});
            this.updateCenters();
        }, () => {
            this.$notify({text: "Не удалось получить доступные города", type: "error"});
        })
    }
}
</script>

<style>
.no-select {
    user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    touch-action: none;
    -webkit-touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -webkit-user-drag: none;
    -webkit-user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
}
</style>