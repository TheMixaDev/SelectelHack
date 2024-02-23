<script setup>
import { RouterLink } from 'vue-router';
import RegisterSelectorComponent from '@/components/RegisterSelectorComponent.vue';
import RegisterEmailComponent from '@/components/RegisterEmailComponent.vue';
import RegisterPhoneComponent from '@/components/RegisterPhoneComponent.vue';

import { AuthService } from '@/services/AuthService';
import RegisterCodeComponent from '@/components/RegisterCodeComponent.vue';
</script>

<template>
    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white text-center">
                        Регистрация
                    </h1>
                    <RegisterSelectorComponent v-if="selected == 0" @select="selected = $event"/>
                    <RegisterEmailComponent v-if="selected == 1" @back="selected = 0" @register="register"/>
                    <RegisterPhoneComponent v-if="selected == 2" @back="selected = 0" @register="register"/>
                    <RegisterCodeComponent v-if="selected == 3" @code="checkCode"
                                                                @resend="resend"
                                                                v-bind:type="verificationType"
                                                                v-bind:login="login"/>
                    <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                        Есть аккаунт?
                        <RouterLink to="/auth" :disabled="loading" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
                            Авторизоваться
                        </RouterLink>
                    </p>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
const emailRegex = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
const phoneRegex = /^\+7\d{10}$/;
const nameRegex = /^[A-Za-zА-Яа-я]+$/;
export default {
    name: 'RegisterView',
    data() {
        return {
            selected: 0,
            userId: -1,
            type: null,
            login: "",
            verificationType: ""
        }
    },
    methods: {
        register(login, password, name) {
            if(login.length < 1) {
                this.$notify({text:"Введите почту или номер телефона", type: "error"});
                return;
            }
            if(password.length < 8) {
                this.$notify({text:"Пароль должен состоять из 8 символов", type: "error"});
                return;
            }
            if(name.length < 1) {
                this.$notify({text:"Введите имя", type: "error"});
                return;
            }
            if(!name.match(nameRegex)) {
                this.$notify({text:"Имя должно состоять только из букв", type: "error"});
                return;
            }
            if(login.match(emailRegex)) {
                AuthService.registerEmail(login, password, name, (data) => {
                    this.type = "email";
                    this.verificationType = "письмо";
                    this.login = login;
                    this.userId = data.user_id;
                    this.selected = 3;
                }, (error) => {
                    console.log(error);
                    Object.values(error.response.data).flat().forEach(message => {
                        this.$notify({text: message, type: "error"});
                    });
                });
            } else if(login.match(phoneRegex)) {
                AuthService.registerPhone(login, password, name, (data) => {
                    this.type = "phone";
                    this.verificationType = "СМС";
                    this.login = login;
                    this.userId = data.user_id;
                    this.selected = 3;
                }, (error) => {
                    console.log(error);
                    Object.values(error.response.data).flat().forEach(message => {
                        this.$notify({text: message, type: "error"});
                    });
                });
            } else {
                this.$notify({text:"Неверная почта или номер телефона", type: "error"});
            }
        },
        resend() {
            if(!this.type) return;
            if(this.type == "email") {
                AuthService.resendEmail(this.userId, () => {
                    this.$notify({text:"Код отправлен на электронную почту", type: "success"});
                }, () => {
                    this.$notify({text:"Не удалось отправить код", type: "error"});
                })
            }
            if(this.type == "phone") {
                AuthService.resendPhone(this.userId, () => {
                    this.$notify({text:"Код отправлен на номер телефона", type: "success"});
                }, () => {
                    this.$notify({text:"Не удалось отправить код", type: "error"});
                })
            }
        },
        checkCode(code) {
            if(!this.type) return;
            if(this.type == "email") {
                AuthService.confirmEmail(code, this.userId, this.login, () => {
                    this.$notify({text:"Успешная регистрация", type: "success"});
                    this.$router.push({name: "auth"});
                }, () => {
                    this.$notify({text:"Неверный код", type: "error"});
                })
            }
            if(this.type == "phone") {
                AuthService.confirmEmail(code, this.userId, this.login, () => {
                    this.$notify({text:"Успешная регистрация", type: "success"});
                    this.$router.push({name: "auth"});
                }, () => {
                    this.$notify({text:"Неверный код", type: "error"});
                })
            }
        }
    }
}
</script>