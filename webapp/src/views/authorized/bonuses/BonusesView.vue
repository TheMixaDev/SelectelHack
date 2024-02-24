<script setup>
import BonusComponent from '@/components/BonusComponent.vue';
import UITableEmpty from '@/components/ui/table/UITableEmpty.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Доступные бонусы
                    </h1>
                    <div v-if="bonuses.length > 0">
                        <BonusComponent v-for="bonus in bonuses" :json="bonus" :key="bonus.id" class="mb-2"/>
                    </div>
                    <UITableEmpty v-else/>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { BonusService } from '@/services/BonusService'
export default {
    name: 'BonusesView',
    data() {
        return {
            bonuses: []
        }
    },
    mounted() {
        BonusService.getBonuses((data) => {
            this.bonuses = data.results;
        }, () => {
            this.$notify({text: "Не удалось получить доступные бонусы", type: "error"});
        })
    }
}
</script>