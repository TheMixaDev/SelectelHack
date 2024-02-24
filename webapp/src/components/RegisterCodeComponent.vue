<script setup>
import UILabeledInput from '@/components/ui/UILabeledInput.vue';
import UIButton from '@/components/ui/UIButton.vue';
</script>

<template>
    <p>Вам было отправлено {{ type }} с кодом на {{ login }}, введите его для подтверждения регистрации.</p>
    <UILabeledInput
        v-model="code"
        type="text"
        property="code"
        placeholder="">
        Код
    </UILabeledInput>
    <p class="text-sm font-light text-gray-500 dark:text-gray-400">
        <a @click="$emit('resend')" :disabled="loading" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
            Отправить код еще раз
        </a>
    </p>
    <UIButton @click="$emit('code', code)" :disabled="loading || !isInputsSet" classExtension="w-full px-5 py-2.5">
        Продолжить
    </UIButton>
</template>

<script>
export default {
    name: 'RegisterCodeComponent',
    props: ['login', 'type'],
    emits: ['code', 'resend'],
    computed: {
        isInputsSet() {
            return this.code.length > 0
        }
    },
    data() {
        return  {
            code: ""
        }
    }
}
</script>