<script setup>
import Datepicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

import UIInlineInput from '@/components/ui/UIInlineInput.vue';
import UISmallButton from '@/components/ui/UISmallButton.vue';
import UIDropdownWithSearch from '@/components/ui/UIDropdownWithSearch.vue';
</script>

<template>
    <div class="loginBlock">
        <div class="loginInputBlock">
            <div class="loginSmall">
                Настройка профиля
            </div>
            <form class="" id="new_user" novalidate="">
                <UIInlineInput v-model="last_name" placeholder="Фамилия*" type="text" property="last_name"/>
                <UIInlineInput v-model="first_name" placeholder="Имя*" type="text" property="first_name"/>
                <UIInlineInput v-model="middle_name" placeholder="Отчество" type="text" property="middle_name"/>
                <p>Дата рождения</p>
                <Datepicker v-model="birth_date"
                    locale="ru-RU"
                    :enable-time-picker="false"
                    class="p-3"
                    :max-date="new Date()"
                    format="dd.MM.yyyy"/>
                <p class="mb-2">Город</p>
                <UIDropdownWithSearch :options="cities" v-model="city" @changed="updateCenters">
                    Выберите город
                </UIDropdownWithSearch>
                <UISmallButton @click="auth" type="button">Войти</UISmallButton>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    name: 'SetupProfileView',
    data() {
        return {
            last_name: '',
            first_name: '',
            middle_name: '',
            birth_date: new Date(),
            city: 0,
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
            }
        }
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