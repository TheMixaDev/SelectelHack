<template>
    <div class="loginSmall">
        <a @click="$emit('select', 1)">
            Регистрация по Email
        </a>
    </div>
    <div class="loginSmall">
        <a @click="$emit('select', 2)">
            Регистрация по номеру телефона
        </a>
    </div>
    <div class="loginSmall">
        Я принимаю условия
        <br>
        <RouterLink to="/rules/">
            Пользовательского соглашения
        </RouterLink>
            и даю своё согласие DonorSearch на обработку моей персональной информации на условиях, определенных 
        <br>
        <RouterLink to="/confidential/">
            Политикой конфиденциальности.
        </RouterLink>
        <br>
        И на получение рекламных рассылок
    </div>
</template>

<script>
export default {
    name: "RegisterSelectorComponent",
    emits: ['select']
}
</script>