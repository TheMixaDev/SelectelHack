<script setup>
import Datepicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

import UIDropdownWithSearch from '@/components/ui/UIDropdownWithSearch.vue';
import UILabeledInput from '@/components/ui/UILabeledInput.vue';
import UIButton from '@/components/ui/UIButton.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Настройка профиля
                    </h1>
                    <div class="space-y-4 md:space-y-6" action="#">
                        <UILabeledInput
                            v-model="last_name"
                            type="text"
                            property="last_name"
                            placeholder="">
                            Фамилия
                        </UILabeledInput>
                        <UILabeledInput
                            v-model="first_name"
                            type="text"
                            property="first_name"
                            placeholder="">
                            Имя
                        </UILabeledInput>
                        <UILabeledInput
                            v-model="middle_name"
                            type="text"
                            property="middle_name"
                            placeholder="">
                            Отчество
                        </UILabeledInput>
                        <p>Дата рождения</p>
                        <Datepicker v-model="birth_date"
                            locale="ru-RU"
                            :enable-time-picker="false"
                            :max-date="new Date()"
                            format="dd.MM.yyyy"/>
                        <p class="mb-2">Город</p>
                        <UIDropdownWithSearch :options="cities" v-model="city_id">
                            Выберите город
                        </UIDropdownWithSearch>
                        <p class="mb-2">Группа крови</p>
                        <UIDropdownWithSearch :options="blood_groups" v-model="blood_group"/>
                        <UIButton @click="save" :disabled="loading || !isInputsSet" classExtension="w-full px-5 py-2.5">
                            Сохранить
                        </UIButton>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { useWebApp } from 'vue-tg';
import { AccountService } from '@/services/AccountService'
import { RegionService } from '@/services/RegionService'
export default {
    name: 'SetupProfileView',
    data() {
        return {
            last_name: '',
            first_name: '',
            middle_name: '',
            isAuth: true,
            birth_date: new Date(),
            city_id: 0,
            blood_group: 0,

            cities: {},
            blood_groups: {
                0: "Не знаю",
                "o_plus": "Первая положительная - 0(I) Rh+",
                "o_minus": "Первая отрицательная - 0(I) Rh-",
                "a_plus": "Вторая положительная - A(II) Rh+",
                "a_minus": "Вторая отрицательная - A(II) Rh-",
                "b_plus": "Третья положительная - B(III) Rh+",
                "b_minus": "Третья отрицательная - B(III) Rh-",
                "ab_plus": "Четвертая положительная - AB(IV) Rh+",
                "ab_minus": "Четвертая отрицательная - AB(IV) Rh-",
            },
            profile: {},
        }
    },
    computed: {
        isInputsSet() {
            return this.last_name.length > 0 && this.first_name.length > 0 && this.city_id > 0;
        }
    },
    methods: {
        save() {
            if(this.last_name.length < 1) {
                this.$notify({text: "Введите фамилию", type: "error"});
                return;
            }
            if(this.first_name.length < 1) {
                this.$notify({text: "Введите имя", type: "error"});
                return;
            }
            if(this.city_id < 1) {
                this.$notify({text: "Выберите город", type: "error"});
                return;
            }
            this.profile.last_name = this.last_name;
            this.profile.first_name = this.first_name;
            this.profile.middle_name = this.middle_name;

            this.profile.birth_date = this.birth_date.toISOString().substring(0, 10);
            this.profile.city_id = this.city_id;
            this.profile.blood_group = this.blood_group;
            AccountService.patchMe({
                last_name: this.profile.last_name,
                first_name: this.profile.first_name,
                middle_name: this.profile.middle_name,
                birth_date: this.profile.birth_date,
                city_id: this.profile.city_id * 1,
                blood_group: this.profile.blood_group + ""
            }, () => {
                this.$notify({text: "Профиль сохранен", type: "success"});
                let type = sessionStorage.getItem("is_auth") ? "auth" : "update";
                sessionStorage.removeItem("is_auth");
                useWebApp().sendData(JSON.stringify(
                        {
                            type: type,
                            data: {
                                token: this.$cookies.get("token")
                            },
                            hash: this.$cookies.get("hash"),
                            id: this.$cookies.get("id")
                        }
                    ));
            }, () => {
                this.$notify({text: "Не удалось сохранить профиль", type: "error"});
            }, this.$cookies);
        }
    },
    mounted() {
        this.isAuth = sessionStorage.getItem("is_auth") ? true : false;
        RegionService.getCities((data) => {
            this.cities = data.results.reduce((acc, cur) => {
                acc[cur.id] = cur.title;
                return acc;
            }, {});
            AccountService.getMe((data) => {
                data = data.data;
                this.profile = data;
                this.last_name = data.last_name ? data.last_name : "";
                this.first_name = data.first_name ? data.first_name : "";
                this.middle_name = data.middle_name ? data.middle_name : "";
                this.birth_date = new Date(data.birth_date ? data.birth_date : "1970-01-01");
                this.city_id = data.city_id ? data.city_id : 0;
                this.blood_group = data.blood_group ? data.blood_group : 0;
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
.loginBlock { 
    max-width: 460px; 
    margin: 0 auto; 
    background-color: #fff; 
    padding: 40px 40px; 
    box-shadow: 0 1px 1px #f2f2f2; 
    border-radius: 4px;
}

.loginNav { 
    display: -webkit-flex; 
    display: -moz-box; 
    display: flex; 
    -webkit-align-items: center; 
    -moz-box-align: center; 
    align-items: center; 
    border-bottom: 1px solid rgba(182,185,193,.4);
} 

.loginInputBlock { 
    text-align: center; 
    color: #86807a;
} 

.loginItem { 
    -webkit-flex-basis: 50%; 
    flex-basis: 50%; 
    max-width: 50%; 
    position: relative; 
    text-align: center;
} 

.loginSmall { 
    font-size: 1em; 
    line-height: 1.5; 
    text-align: center; 
    color: #828282; 
    margin: 16px 0; 
    font-weight: 400;
}  

.loginInputBlock > form  { 
    font-weight: 400;
} 

.loginFooter > span  { 
    text-align: center; 
    color: #86807a; 
    font-weight: 400;
} 

.loginActiveItem { 
    color: #000!important; 
    border-bottom: 2px solid #f7c41c;
} 

.loginItem a  { 
    font-size: 1.625em; 
    font-weight: 400; 
    line-height: 1.5; 
    padding-bottom: 10px; 
    display: block; 
    color: #5f6177;
} 

.loginInputBlock > form > div  { 
    margin-bottom: 16px;
} 

.loginFooter > span > a  { 
    color: #3892ea; 
    font-weight: 400; 
    -webkit-transition: .2s ease-in-out; 
    transition: .2s ease-in-out;
} 

.loginFooter > span > a:hover { 
    color: #4183c4;
} 

.loginPasswordForgot { 
    position: absolute; 
    top: 0; 
    right: 0; 
    height: 100%; 
    display: -webkit-flex; 
    display: -moz-box; 
    display: flex; 
    -webkit-align-items: center; 
    -moz-box-align: center; 
    align-items: center; 
    -webkit-justify-content: flex-end; 
    -moz-box-pack: end; 
    justify-content: flex-end; 
    margin-right: 8px; 
    cursor: pointer; 
    color: #5f6177; 
    font-weight: 400; 
    -webkit-transition: all .2s ease-in-out; 
    transition: all .2s ease-in-out; 
    border-bottom: 1px solid transparent;
} 
</style>