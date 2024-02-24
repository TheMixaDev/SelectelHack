<script setup>
import DonationComponent from '@/components/DonationComponent.vue';
import UITableEmpty from '@/components/ui/table/UITableEmpty.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Мои донации
                    </h1>
                    <div v-if="donations?.length > 0">
                        <DonationComponent v-for="donation in donations" :json="donation" :key="donation.id" class="mb-2" @edit="edit"/>
                    </div>
                    <UITableEmpty v-else/>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { DonationService } from '@/services/DonationService'
export default {
    name: 'DonationsView',
    data() {
        return {
            donations: []
        };
    },
    methods: {
        edit(json) {
            localStorage.setItem("donation", JSON.stringify(json));
            this.$router.push({ name: "createDonation" });
        }
    },
    mounted() {
        DonationService.getDonations((data) => {
            this.donations = data;
        }, () => {
            this.$notify({ text: "Не удалось получить донации", type: "error" });
        }, this.$cookies);
    }
}
</script>