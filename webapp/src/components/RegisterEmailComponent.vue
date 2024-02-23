<script setup>
import UILargeButton from '@/components/ui/UILargeButton.vue';
import UIOutlineInput from '@/components/ui/UIOutlineInput.vue';
</script>

<template>
    <div class="loginBack">
        <div>
            <a @click="$emit('back')">
                <i class="zmdi zmdi-arrow-left mr-2">
                </i>
                Назад
            </a>
        </div>
    </div>
    <div class="loginSignupHeader">
        <h2>
        Регистрация по Email
        </h2>
    </div>
    <form class="" id="registration">
    <UIOutlineInput property="email" type="email" v-model="email" tip="">
        Email*
    </UIOutlineInput>
    <UIOutlineInput property="password" type="password" v-model="password" tip="Пароль должен содержать минимум 8 символов и состоять из цифр и букв">
        Пароль*
    </UIOutlineInput>
    <UIOutlineInput property="first_name" type="text" v-model="name" tip="">
        Имя*
    </UIOutlineInput>
    <UILargeButton type="button" @click="$emit('register', email, password, name)">Зарегистрироваться</UILargeButton>
    </form>
</template>

<script>
export default {
    name: 'RegisterEmailComponent',
    emits: ['back'],
    data() {
        return {
            email: "",
            password: "",
            name: ""
        }
    }
}
</script>

<style>
.loginSignupHeader > h2  { 
    font-weight: 400; 
    margin: 16px 0;
} 
</style>