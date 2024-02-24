<script setup>
import UILabeledInput from './ui/UILabeledInput.vue';
import UIButton from './ui/UIButton.vue';
</script>


<template>
    <UILabeledInput
        v-model="phone"
        type="text"
        property="phone"
        placeholder="">
        Телефон
    </UILabeledInput>
    <UILabeledInput
        v-model="password"
        type="password"
        property="password"
        placeholder="">
        Пароль
    </UILabeledInput>
    <small>Пароль должен содержать минимум 8 символов и состоять из цифр и букв</small>
    <UILabeledInput
        v-model="name"
        type="text"
        property="name"
        placeholder="">
        Имя
    </UILabeledInput>
    <UIButton @click="$emit('register', phone, password, name)" :disabled="loading || !isInputsSet" classExtension="w-full px-5 py-2.5">
        Зарегистрироваться
    </UIButton>
    <p class="text-sm font-light text-gray-500 dark:text-gray-400">
        <a @click="$emit('back')" :disabled="loading" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
            Вернуться на выбор типа регистрации
        </a>
    </p>
</template>

<script>
export default {
    name: 'RegisterPhoneComponent',
    emits: ['back'],
    computed: {
        isInputsSet() {
            return this.phone.length > 0 && this.password.length > 0 && this.name.length > 0;
        }
    },
    data() {
        return {
            phone: "",
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