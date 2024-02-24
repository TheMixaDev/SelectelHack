<script setup>
import { RouterLink } from 'vue-router';
import { AuthService } from '@/services/AuthService';
import UILabeledInput from '@/components/ui/UILabeledInput.vue';
import UIButton from '@/components/ui/UIButton.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Авторизация
                    </h1>
                    <div class="space-y-4 md:space-y-6" action="#">
                        <UILabeledInput
                            v-model="login"
                            type="text"
                            property="login"
                            placeholder="">
                            Почта или телефон
                        </UILabeledInput>
                        <UILabeledInput
                            v-model="password"
                            type="password"
                            property="password"
                            placeholder="">
                            Пароль
                        </UILabeledInput>
                        <UIButton @click="auth" :disabled="loading || !isInputsSet" classExtension="w-full px-5 py-2.5">
                            Войти
                        </UIButton>
                        <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                            <RouterLink to="/restore" :disabled="loading" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
                                Забыли пароль?
                            </RouterLink>
                        </p>
                        <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                            Нет аккаунта?
                            <RouterLink to="/register" :disabled="loading" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
                                Зарегестрироваться
                            </RouterLink>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: 'AuthView',
    data() {
        return {
            login: "",
            password: "",

            loading: false
        }
    },
    computed: {
        isInputsSet() {
            return this.login.length > 0 && this.password.length > 0;
        }
    },
    methods: {
        auth() {
            if(this.login.length < 1) {
                this.$notify({text:"Введите почту или номер телефона", type: "error"});
                return;
            }
            if(this.password.length < 1) {
                this.$notify({text:"Введите пароль", type: "error"});
                return;
            }
            AuthService.login(this.login, this.password, (data) => {
                let token = data.headers.token;
                this.$cookies.set('token', token, "30d");
                sessionStorage.setItem("is_auth", true);
                this.$router.push({name: "setupProfile"});
            }, (error) => {
                Object.values(error.response.data).flat().forEach(message => {
                    this.$notify({text: message, type: "error"});
                });
            })
        }
    }
}
</script>