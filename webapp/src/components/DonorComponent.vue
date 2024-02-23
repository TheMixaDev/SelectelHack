<script setup>
const NO_PHOTO = 'https://139115.selcdn.ru/ds_staging_media/media/backend/pictures/5bcfe1ee76474a7ab498649e238813ea.medium.jpg';
</script>

<template>
    <div class="items-center bg-gray-50 rounded-lg shadow sm:flex dark:bg-gray-800 dark:border-gray-700">
        <a href="#">
            <img class="w-full rounded-lg sm:rounded-none sm:rounded-l-lg" :src="json.photo ? json.photo.medium : NO_PHOTO" alt="Avatar">
        </a>
        <div class="p-5">
            <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                <a href="#">{{ json.first_name ? json.first_name : "Безымянный" }} {{ json.last_name }}</a>
            </h3>
            <span class="text-gray-500 dark:text-gray-400" v-if="json.city">Город: {{json.city.title}}</span>
            <p class="mt-3 mb-4 font-light text-gray-500 dark:text-gray-400">
                Донаций: {{ json.donation_agg.count }}
            </p>
            <p class="mt-3 mb-4 font-light text-gray-500 dark:text-gray-400" v-if="json.donor_status">
                Статус донора: {{ json.donor_status?.name }}
            </p>
        </div>
    </div> 
</template>

<script>
export default {
    name: 'DonorComponent',
    props: ['json']
}
</script>