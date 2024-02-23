<script setup>
import DonorComponent from '@/components/DonorComponent.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Топ доноров
                    </h1>
                    <div class="grid gap-8 mb-6 lg:mb-16 grid-cols-2">
                        <DonorComponent v-for="(donor, index) in top" :json="donor" :key="donor.id" :position="index+1"/>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
        });
    }
}
</script>