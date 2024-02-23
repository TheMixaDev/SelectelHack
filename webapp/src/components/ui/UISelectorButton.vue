<script setup>
import GreenMarkIcon from '@/assets/icons/GreenMarkIcon.vue';
import RedCrossIcon from '@/assets/icons/RedCrossIcon.vue';
import UIButton from './UIButton.vue';
</script>

<template>
    <div :class="['flex flex-col p-6 mx-auto max-w-lg text-center text-gray-900 bg-white rounded-lg border border-gray-100 shadow dark:border-gray-600 xl:p-8 dark:bg-gray-800 dark:text-white', active ? 'active' : '']">
        <h3 class="mb-4 text-lg font-semibold">{{ name }}</h3>
        <ul role="list" class="mb-8 space-y-4 text-left">
            <li class="flex items-center space-x-3" v-for="feature in features" :key="feature">
                <GreenMarkIcon/>
                <span>{{ feature }}</span>
            </li>
            <li class="flex items-center space-x-3" v-for="debuff in debuffs" :key="debuff">
                <RedCrossIcon/>
                <span>{{ debuff }}</span>
            </li>
        </ul>
        <UIButton
            @click="$emit('select')"
            classExtension="w-full px-5 py-2.5"
            :disabled="active">{{ active ? "Выбрано" : "Выбрать"}}</UIButton>
    </div>
</template>

<script>
export default {
    name: 'UISelectorButton',
    emits: ['select'],
    props: ['name', 'active', 'features', 'debuffs']
}
</script>

<style>
.active { 
    border: 1px solid #f73e3e; 
}
</style>