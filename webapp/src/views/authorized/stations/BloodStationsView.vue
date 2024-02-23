<script setup>
import UIDropdownWithSearch from '@/components/ui/UIDropdownWithSearch.vue';
import BloodStationComponent from '@/components/BloodStationComponent.vue';
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
                        <p class="mb-2">Группа крови</p>
                        <UIDropdownWithSearch :options="blood_groups" v-model="blood_group" @changed="loadStations"/>
                    </div>
                    <div>
                        <BloodStationComponent v-for="station in stations" :json="station" :key="station.id" class="mb-2" @donate="planDonation"/>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { AccountService } from '@/services/AccountService'
import { RegionService } from '@/services/RegionService'
import { StationService } from '@/services/StationService'
export default {
    name: 'BloodStationsView',
    data() {
        return {
            city_id: 0,
            blood_group: 0,

            cities: {
                0: "Загрузка..."
            },
            blood_groups: {
                0: "Любая",
                "o_plus": "Первая положительная - 0(I) Rh+",
                "o_minus": "Первая отрицательная - 0(I) Rh-",
                "a_plus": "Вторая положительная - A(II) Rh+",
                "a_minus": "Вторая отрицательная - A(II) Rh-",
                "b_plus": "Третья положительная - B(III) Rh+",
                "b_minus": "Третья отрицательная - B(III) Rh-",
                "ab_plus": "Четвертая положительная - AB(IV) Rh+",
                "ab_minus": "Четвертая отрицательная - AB(IV) Rh-",
            },
            stations: []
        }
    },
    methods: {
        loadStations() {
            if(!this.city_id)
                return;
            this.stations = [];
            StationService.getNeeds(this.city_id, this.blood_group, (data) => {
                this.stations = data.results;
            }, () => {
                this.$notify({text: "Не удалось получить доступные центры сдачи крови", type: "error"});
            });
        },
        planDonation(json) {
            localStorage.setItem("station", JSON.stringify(json));
            this.$router.push({name: "planDonation"});
        }
    },
    mounted() {
        RegionService.getCities((data) => {
            this.cities = data.results.reduce((acc, cur) => {
                acc[cur.id] = cur.title;
                return acc;
            }, {});
            AccountService.getMe((data) => {
                this.profile = data;
                this.last_name = data.last_name;
                this.first_name = data.first_name;
                this.middle_name = data.middle_name;
                this.birth_date = new Date(data.birth_date);
                this.city_id = data.city_id;
                this.blood_group = data.blood_group ? data.blood_group : 0;
                this.loadStations();
            }, () => {
                this.$notify({text: "Не удалось получить профиль", type: "error"});
            }, this.$cookies)
        }, () => {
            this.$notify({text: "Не удалось получить доступные города", type: "error"});
        });
    }
}
</script>