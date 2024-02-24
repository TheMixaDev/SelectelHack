<script setup>
import { BonusService } from '@/services/BonusService';
import UIButton from './ui/UIButton.vue';
import StarsComponent from './StarsComponent.vue';
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
            <div class="text-center mt-2">
                <span class="text-gray-500 dark:text-gray-400 text-lg">Оцените бонус</span><br>
                <StarsComponent class="inline-flex" v-model="stars"/>
                <UILabeledInput v-model="comment">Комментарий</UILabeledInput>
                <UIButton
                    @click="send"
                    classExtension="w-full px-5 py-2.5 mt-2"
                    :disabled="loading"
                >Отправить отзыв</UIButton>
            </div>
        </div>
    </div> 
</template>

<script>
import { useWebAppPopup } from 'vue-tg'
import UILabeledInput from './ui/UILabeledInput.vue';
export default {
    name: 'BonusComponent',
    props: ['json'],
    data() {
        return {
            loading: false,
            stars: 5,
            comment: ""
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
        },
        send() {
            // TODO : send review
            useWebAppPopup().showAlert(`Отзыв отправлен!`);
        }
    }
}
</script>