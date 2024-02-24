<script setup>
import UILabeledInput from './ui/UILabeledInput.vue';
import UIButton from './ui/UIButton.vue';
</script>

<template>
    <UILabeledInput
        v-model="email"
        type="text"
        property="email"
        placeholder="">
        Почта
    </UILabeledInput>
    <UILabeledInput
        v-model="password"
        type="text"
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
    <UIButton @click="$emit('register', email, password, name)" :disabled="loading || !isInputsSet" classExtension="w-full px-5 py-2.5">
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
    name: 'RegisterEmailComponent',
    emits: ['back'],
    computed: {
        isInputsSet() {
            return this.email.length > 0 && this.password.length > 0 && this.name.length > 0;
        }
    },
    data() {
        return {
            email: "",
            password: "",
            name: ""
        }
    }
}
</script>