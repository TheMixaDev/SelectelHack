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
        </div>
    </div> 
</template>

<script>
export default {
    name: 'BonusComponent',
    props: ['json'],
    data() {
        return {
            loading: false
        }
    }
}
</script>