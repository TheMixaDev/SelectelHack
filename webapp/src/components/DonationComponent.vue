<script setup>
import UIButton from './ui/UIButton.vue';

const classes = {
    "blood": 'Цельная кровь',
    "plasma": 'Плазма',
    "platelets": 'Тромбоциты',
    "erythrocytes": 'Эритроциты',
    "leukocytes": 'Гранулоциты'
};
</script>

<template>
    <div class="items-center bg-gray-50 rounded-lg shadow sm:flex dark:bg-gray-800 dark:border-gray-700">
        <div class="p-5">
            <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                Донация {{ json.donate_at }}
            </h3>
            <span class="text-gray-500 dark:text-gray-400">{{json.city.title}}, {{ json.payment_type == "free" ? "Безвозмездная" : "Платная" }}</span><br>
            <span class="text-gray-500 dark:text-gray-400">Тип: {{ classes[json.blood_class] }}</span>
        </div>
        <UIButton @click="$emit('edit', json)" classExtension="w-full px-5 py-2.5">Редактировать</UIButton>
    </div> 
</template>

<script>
export default {
    name: 'DonationComponent',
    props: ['json'],
    emits: ['edit']
}
</script>