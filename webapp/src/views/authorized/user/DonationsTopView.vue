<script setup>
import DonorComponent from '@/components/DonorComponent.vue';
</script>

<template>
    <div class="p-3 text-lg">
        <div class="p-3 text-center">
            <b class="text-3xl">Топ доноров</b>
        </div>
    </div>
    <DonorComponent v-for="donor in top" :json="donor" :key="donor.id" class="mb-2"/>
</template>

<script>
import { AccountService } from '@/services/AccountService'
export default {
    name: 'DonationsTopView',
    data() {
        return {
            top: []
        }
    },
    mounted() {
        AccountService.getTopDonors((data) => {
            this.top = data.items;
        }, () => {
            this.$notify({text: "Не удалось получить топ доноров", type: "error"});
        }, this.$cookies);
    }
}
</script>