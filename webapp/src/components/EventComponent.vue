<template>
    <div class="items-center bg-gray-50 rounded-lg shadow sm:flex dark:bg-gray-800 dark:border-gray-700">
        <a href="#" v-if="json.author && json.author.image">
            <img class="w-auto h-[200px] rounded-lg sm:rounded-none sm:rounded-l-lg ml-auto mr-auto" :src="json.author && json.author.image ? json.author.image : ''" alt="Avatar">
        </a>
        <div class="p-5">
            <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                <a href="#">{{ json.name }}</a>
            </h3>
            <span class="text-gray-500 dark:text-gray-400" v-if="json.city">Город: {{json.city.title}}</span><br>
            <span class="text-gray-500 dark:text-gray-400" v-if="json.address">Адрес: {{json.address}}</span><br>
            <span class="text-gray-500 dark:text-gray-400 text-xs">
                {{json.start_date?.slice(0, 10).replaceAll("-",".") }} - {{ json.end_date?.slice(0, 10).replaceAll("-",".") }}
            </span>
        </div>
    </div> 
</template>

<script>
export default {
    name: 'EventComponent',
    props: ['json']
}
</script>