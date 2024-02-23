<template>
    <div class="loginSignupHeader">
        <h2>
            Вам было отправлено {{ type }} с кодом на {{ login }}, введите его для подтверждения регистрации.
        </h2>
    </div>
    <div class="mb-3 d-flex justify-content-between align-items-center">
        <label for="email">
        Код
        </label>
        <div class="text-left ml-3 w-75">
        <input class="loginInput" placeholder="" type="text" name="text" id="text" autocomplete="off" v-model="code">
        </div>
    </div>
    <div class="loginSmall">
        <a @click="$emit('resend')">
            Отправить код еще раз
        </a>
    </div>
    <input type="button" class="loginSubmit loginSubmitRed" value="Продолжить" @click="$emit('code', code)">
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