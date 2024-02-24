<script setup>
import UIButton from './ui/UIButton.vue';
</script>

<template>
    <div class="items-center bg-gray-50 rounded-lg shadow sm:flex dark:bg-gray-800 dark:border-gray-700">
        <div class="p-5">
            <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                <a :href="json.parser_url">{{ json.title }}</a>
            </h3>
            <span class="text-gray-500 dark:text-gray-400">{{json.city.title}}, {{ json.address }}</span>
            <p class="mt-3 mb-4 font-light text-gray-500 dark:text-gray-400">
                Телефон: <a v-for="number in json.phone_numbers" :key="number.id">{{ number.phone }} &nbsp;</a><br>
            </p>

            <ul class="flex space-x-4 sm:mt-0">
                <li v-for="(value, key) in blood_groups" :key="key">
                    <a href="#" :class="json[value] == 'need' ? 'red' : 'green'">
                        {{ key }}
                    </a>
                </li>
            </ul>
        </div>
        <div class="text-center mb-2">
            <a href="#" @click="workingHours">Узнать часы работы</a>
        </div>
        <UIButton @click="$emit('donate', json)" classExtension="w-full px-5 py-2.5">
            Запланировать донацию
        </UIButton>
    </div> 
</template>

<script>
import { useWebAppPopup } from 'vue-tg'
export default {
    name: 'BloodStationComponent',
    props: ['json'],
    data() {
        return {
            blood_groups: {
                '0+': "o_plus",
                'A+': "a_plus",
                'B+': "b_plus",
                'AB+': "ab_plus",
                '0-': "o_minus",
                'A-': "a_minus",
                'B-': "b_minus",
                'AB-': "ab_minus"
            },
            extended: false
        }
    },
    methods: {
        workingHours() {
            let result = ``;
            for (let i = 0; i < this.json.schedule.length; i++) {
                result += `${this.json.schedule[i].dow}: ${this.json.schedule[i].start} - ${this.json.schedule[i].end}\n`;
            }
            useWebAppPopup().showAlert(result);
        }
    }
}
</script>

<style>
.red {
    color: red;
}
.green {
    color: green;
}
</style>