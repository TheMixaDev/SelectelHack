<script setup>
import { RouterLink } from 'vue-router';
import UILabeledInput from '@/components/ui/UILabeledInput.vue';
import UIButton from '@/components/ui/UIButton.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Восстановление аккаунта
                    </h1>
                    <div class="space-y-4 md:space-y-6" action="#">
                        <div v-if="!sentCode" class="space-y-4 md:space-y-6">
                            <UILabeledInput
                                v-model="login"
                                type="text"
                                property="login"
                                :disabled="loading"
                                placeholder="">
                                Почта или телефон
                            </UILabeledInput>
                            <UIButton @click="sendCode" :disabled="loading || !isInputsSet" classExtension="w-full px-5 py-2.5">
                                Отправить код восстановления
                            </UIButton>
                        </div>
                        <div v-if="sentCode">
                            <p>Ссылка для восстановления отправлена на электронную почту {{ login }}. Действуйте согласно дальнейшим инструкциям в письме. Если письмо не обнаружено, проверьте папку "Спам" и "Рассылки"</p>
                        </div>
                        <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                            Есть аккаунт?
                            <RouterLink to="/auth" :disabled="loading" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
                                Авторизоваться
                            </RouterLink>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { AccountService } from '@/services/AccountService';
export default {
    name: 'RestoreView',
    data() {
        return {
            login: "",

            sentCode: false,
            loading: false
        }
    },
    computed: {
        isInputsSet() {
            return this.login.length > 0;
        },
        isInputsSetCode() {
            return this.code.length > 0;
        }
    },
    methods: {
        sendCode() {
            if(this.login.length < 1) {
                this.$notify({text:"Введите почту или номер телефона", type: "error"});
                return;
            }
            this.loading = true;
            AccountService.recover(this.login, () => {
                this.loading = false;
                this.sentCode = true;
                this.$notify({text: "Код отправлен", type: "success"});
            }, (error) => {
                this.$notify({text: error.response.data.message, type: "error"});
            });
        }
    }
}
</script>