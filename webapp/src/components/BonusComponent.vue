<script setup>
import { BonusService } from '@/services/BonusService';
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
            <UIButton
                @click="claim"
                classExtension="w-full px-5 py-2.5"
                :disabled="loading"
            >Забрать бонус</UIButton>
        </div>
    </div> 
</template>

<script>
import { useWebAppPopup } from 'vue-tg'
export default {
    name: 'BonusComponent',
    props: ['json'],
    data() {
        return {
            loading: false
        }
    },
    methods: {
        claim() {
            this.loading = true;
            BonusService.getBonus(this.json.id, (data) => {
                this.loading = false;
                useWebAppPopup().showAlert(`Промокод: ${data.promocode}`);
            }, () => {
                this.loading = false;
                this.$notify({text: "Не удалось забрать бонус", type: "error"});
            })
        }
    }
}
</script>