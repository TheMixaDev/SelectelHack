<script setup>
const NO_PHOTO = 'https://139115.selcdn.ru/ds_staging_media/media/backend/pictures/5bcfe1ee76474a7ab498649e238813ea.medium.jpg';
</script>

<template>
    <div :class="['items-center bg-gray-50 rounded-lg shadow sm:flex dark:bg-gray-800 dark:border-gray-700',
                    position == 1 ? 'top_first' : '',
                    position == 2 ? 'top_second' : '',
                    position == 3 ? 'top_third' : '',
                    position > 3 && position <= 10 ? 'top_ten' : '']">
        <a href="#">
            <img class="w-full rounded-lg sm:rounded-none sm:rounded-l-lg" :src="json.photo ? json.photo.medium : NO_PHOTO" alt="Avatar">
        </a>
        <div class="p-5">
            <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                <span v-if="position == 1">🥇</span>
                <span v-if="position == 2">🥈</span>
                <span v-if="position == 3">🥉</span>
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
    props: ['json', 'position']
}
</script>

<style>
@keyframes backgroundGradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
@keyframes glowingGoldBorder {
  0% {
    border-image-slice: 1;
    border-color: #ffd700;
    box-shadow: 0 0 10px #ffd700;
  }
  50% {
    border-image-slice: 20;
    border-color: #ffaf00;
    box-shadow: 0 0 20px #ffaf00;
  }
  100% {
    border-image-slice: 1;
    border-color: #ffd700;
    box-shadow: 0 0 10px #ffd700;
  }
}
@keyframes glowingSilverBorder {
  0% {
    border-image-slice: 1;
    border-color: #c0c0c0;
    box-shadow: 0 0 10px #c0c0c0;
  }
  50% {
    border-image-slice: 20;
    border-color: #a9a9a9;
    box-shadow: 0 0 20px #a9a9a9;
  }
  100% {
    border-image-slice: 1;
    border-color: #c0c0c0;
    box-shadow: 0 0 10px #c0c0c0;
  }
}
@keyframes glowingBronzeBorder {
    0% {
    border-image-slice: 1;
    border-color: #ffac47;
    box-shadow: 0 0 10px #ffac47;
  }
  50% {
    border-image-slice: 20;
    border-color: #d0913f;
    box-shadow: 0 0 20px #d0913f;
  }
  100% {
    border-image-slice: 1;
    border-color: #ffac47;
    box-shadow: 0 0 10px #ffac47;
  }
}

.top_first {
  background: linear-gradient(45deg, #ffd700, white);
  background-size: 200% 200%;
  border-image: linear-gradient(45deg, #ffd700, white) 1;
  animation: backgroundGradient 1s ease infinite;
  animation: glowingGoldBorder 3s ease infinite;
}
.top_second {
  background: linear-gradient(45deg, #c0c0c0, white);
  background-size: 200% 200%;
  animation: backgroundGradient 1s ease infinite;
  border-image: linear-gradient(45deg, #c0c0c0, white) 1;
  animation: glowingSilverBorder 3s ease infinite;
}
.top_third {
    background: linear-gradient(45deg, #ffac47, white);
  background-size: 200% 200%;
  animation: backgroundGradient 1s ease infinite;
  border-image: linear-gradient(45deg, #ffac47, white) 1;
  animation: glowingBronzeBorder 3s ease infinite;
}
.top_ten {
  border-image: linear-gradient(45deg, #c0c0c0, white) 1;
  animation: glowingSilverBorder 3s ease infinite;
}
</style>