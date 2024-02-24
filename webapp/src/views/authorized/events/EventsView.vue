<script setup>
import EventComponent from '@/components/EventComponent.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        События
                    </h1>
                    <div> 
                        <EventComponent v-for="event in events" :json="event" :key="event.id" class="mb-2"/>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { EventService } from '@/services/EventService';
export default {
    name: 'EventsView',
    data() {
        return {
            events: []
        }
    },
    mounted() {
        EventService.getEvents((data) => {
            this.events = data.results;
        }, () => {
            this.$notify({text: "Не удалось получить события", type: "error"});
        })
    }
}

</script>