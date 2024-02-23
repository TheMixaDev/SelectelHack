<script setup>
import UILargeButton from '@/components/ui/UILargeButton.vue';
import UIOutlineInput from '@/components/ui/UIOutlineInput.vue';
</script>

<template>
    <div class="loginSignupHeader">
        <h2>
            Вам было отправлено {{ type }} с кодом на {{ login }}, введите его для подтверждения регистрации.
        </h2>
    </div>
    <UIOutlineInput property="code" type="text" v-model="code" tip="">
        Код
    </UIOutlineInput>
    <div class="loginSmall">
        <a @click="$emit('resend')">
            Отправить код еще раз
        </a>
    </div>
    <UILargeButton @click="$emit('code', code)">Продолжить</UILargeButton>
</template>

<script>
export default {
    name: 'RegisterCodeComponent',
    props: ['login', 'type'],
    emits: ['code', 'resend'],
    data() {
        return  {
            code: ""
        }
    }
}
</script>