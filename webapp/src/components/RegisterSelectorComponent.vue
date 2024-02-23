<script setup>
import UIButton from './ui/UIButton.vue';
</script>

<template>
    <UIButton @click="$emit('select', 1)" classExtension="w-full px-5 py-2.5">
        Регистрация по Email
    </UIButton>
    <UIButton @click="$emit('select', 2)" classExtension="w-full px-5 py-2.5">
        Регистрация по номеру телефона
    </UIButton>
</template>

<script>
export default {
    name: "RegisterSelectorComponent",
    emits: ['select']
}
</script>