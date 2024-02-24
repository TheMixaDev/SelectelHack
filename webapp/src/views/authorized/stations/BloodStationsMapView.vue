<script setup>
import UIDropdownWithSearch from '@/components/ui/UIDropdownWithSearch.vue';
import BloodStationComponent from '@/components/BloodStationComponent.vue';
import UIButton from '@/components/ui/UIButton.vue';
import { VMap, VMapGoogleTileLayer, VMapZoomControl, VMapDivMarker } from 'vue-map-ui';
</script>
<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Центры сдачи крови
                    </h1>
                    <div class="space-y-4 md:space-y-6" action="#">
                        <p class="mb-2">Город</p>
                        <UIDropdownWithSearch :options="cities" v-model="city_id" @changed="loadStations"/>
                    </div>
                    <div>
                        <VMap style="height: calc(100vh - 220px)" ref="map" theme="dark" :zoom="2" :min-zoom="2" class="z-0 rounded-lg" v-if="!selected_station">
                            <VMapGoogleTileLayer />
                            <VMapZoomControl />
                            <VMapDivMarker
                                v-for="station in stations"
                                v-model:latlng="station.latlng"
                                :icon-size="[20, 20]"
                                :icon-anchor="[10, 10]"
                                :key="station.id"
                                @click="selectStation(station)">
                                <div class="marker"></div>
                            </VMapDivMarker>
                        </VMap>
                        <div v-else>
                            <UIButton @click="initializeReturn" classExtension="w-full px-5 py-2.5 mb-4">Вернуться на карту</UIButton>
                            <BloodStationComponent :json="selected_station" @donate="planDonation"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { StationService } from '@/services/StationService';
import { RegionService } from '@/services/RegionService';
import { AccountService } from '@/services/AccountService';
export default {
    name: 'BloodStationsMapView',
    data() {
        return {
            city_id: 0,
            selected_station: 0,
            cities: {
                0: "Загрузка..."
            },
            stations: [],
            map_position: [],
            mapReady: false,
            nullInterval: -1
        }
    },
    methods: {
        loadStations() {
            if(!this.city_id)
                return;
            this.stations = [];
            StationService.getStations(this.city_id, (data) => {
                this.stations = data.results;
                let minLat = 10000;
                let maxLat = -10000;
                let minLng = 10000;
                let maxLng = -10000;
                this.stations.forEach(station => {
                    station.latlng = [station.lat, station.lng];
                    minLat = Math.min(station.lat, minLat);
                    maxLat = Math.max(station.lat, maxLat);
                    minLng = Math.min(station.lng, minLng);
                    maxLng = Math.max(station.lng, maxLng);
                });
                let centerLat = (minLat + maxLat) / 2;
                let centerLng = (minLng + maxLng) / 2;
                this.map_position = [centerLat, centerLng];
                if(!this.mapReady) return;
                    this.$refs.map.map.setView(this.map_position, 6);
            }, () => {
                this.$notify({text: "Не удалось получить доступные центры сдачи крови", type: "error"});
            });
        },
        initializeReturn() {
            this.mapReady = false;
            this.nullInterval = setInterval(this.checkIsNotNull, 0);
            this.selected_station = 0;
            this.returnToMap();
        },
        returnToMap() {
            if(!this.mapReady)
                return setTimeout(this.returnToMap, 10);
            this.$refs.map.map.setView(this.map_position, 6);
        },
        selectStation(station) {
            this.selected_station = station;
        },
        planDonation(json) {
            localStorage.setItem("station", JSON.stringify(json));
            this.$router.push({name: "planDonation"});
        },
        checkIsNotNull() {
            if(this.$refs.map && this.$refs.map.map) {
                clearInterval(this.nullInterval);
                this.mapReady = true;
            }
        },
    },
    mounted() {
        this.nullInterval = setInterval(this.checkIsNotNull, 0);
        RegionService.getCities((data) => {
            this.cities = data.results.reduce((acc, cur) => {
                acc[cur.id] = cur.title;
                return acc;
            }, {});
            this.loadStations();
            AccountService.getMe((data) => {
                this.city_id = data.city_id;
            }, () => {
                this.$notify({text: "Не удалось получить профиль", type: "error"});
            }, this.$cookies)
        }, () => {
            this.$notify({text: "Не удалось получить доступные города", type: "error"});
        });
    }
}
</script>

<style>
.marker {
    /* Set the marker size here */
    width: 2rem;
    height: 2rem;
    border-radius: 2rem;
    /* Set the marker color here */
    background: #aa3300;

    display: inline-block;
    border-bottom-right-radius: 0;
    transform: rotate(45deg);

    /* optional fanciness */
    border: 1px solid #881100;
}
/* inner circle (optional if you don't need the central dot) */
.marker::before {
    content: "";
    background: white;
    width: 50%;
    height: 50%;
    border-radius: 100%;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);

    /* optional fanciness */
    box-shadow: 0.1rem 0.1rem 0.2rem 0.1rem rgba(0, 0, 0, 0.1);
}
/* shadow (optional if you don't need a shadow) */
.marker::after {
    content: "";
    background: rgba(128, 128, 128, 0.2);
    width: 75%;
    height: 75%;
    border-radius: 100%;
    position: absolute;
    top: 100%;
    left: 100%;
    transform: translate(-50%, -50%) rotate(45deg) scaleX(0.5);
}
</style>