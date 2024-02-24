<script setup>
import StarYellowIcon from '@/assets/icons/StarYellowIcon.vue';
import StarGrayIcon from '@/assets/icons/StarGrayIcon.vue';
</script>

<template>
    <div class="flex items-center">
        <StarYellowIcon v-for="index in modelValue" :key="index" @click="$emit('update:modelValue', index)"/>
        <StarGrayIcon v-for="index in (5 - modelValue)" :key="index" @click="$emit('update:modelValue', index + modelValue)"/>
    </div>
</template>

<script>
export default {
    name: "StarsComponent",
    props: ['modelValue'],
    emits: ['update:modelValue'],
}
</script>