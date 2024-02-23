<script setup>
import BonusComponent from '@/components/BonusComponent.vue';
</script>

<template>
    <div class="p-3 text-lg">
        <div class="p-3 text-center">
            <b class="text-3xl">Доступные бонусы</b>
        </div>
    </div>
    <BonusComponent v-for="bonus in bonuses" :json="bonus" :key="bonus.id" class="mb-2"/>
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