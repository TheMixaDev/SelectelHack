<script setup>
import UIButton from './ui/UIButton.vue';
</script>

<template>
    <div class="items-center bg-gray-50 rounded-lg shadow sm:flex dark:bg-gray-800 dark:border-gray-700">
        <a href="#">
            <img class="w-full rounded-lg sm:rounded-none sm:rounded-l-lg" :src="json.bonus_image ? json.bonus_image : NO_PHOTO" alt="Avatar">
        </a>
        <div class="p-5">
            <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                <a href="#">{{ json.bonus_name }}</a>
            </h3>
            <span class="text-gray-500 dark:text-gray-400" v-if="json.city">От: {{json.partner_name}}</span>
            <p class="mt-3 mb-4 font-light text-gray-500 dark:text-gray-400">
                Получен: {{ json.is_taken ? 'Да' : 'Нет' }}
            </p>
            <UIButton
                @click="$emit('claim', json)"
                classExtension="w-full px-5 py-2.5"
                :disabled="true"
            >Забрать бонус</UIButton>
        </div>
    </div> 
</template>

<script>
export default {
    name: 'BonusComponent',
    props: ['json'],
    emits: ['claim']
}
</script>