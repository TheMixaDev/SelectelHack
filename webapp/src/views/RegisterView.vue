<script setup>
import { RouterLink } from 'vue-router';
import RegisterSelectorComponent from '@/components/RegisterSelectorComponent.vue';
import RegisterEmailComponent from '@/components/RegisterEmailComponent.vue';
import RegisterPhoneComponent from '@/components/RegisterPhoneComponent.vue';

import { AuthService } from '@/services/AuthService';
import RegisterCodeComponent from '@/components/RegisterCodeComponent.vue';
</script>

<template>
    <div class="loginBlock">
        <div class="loginNav d-flex justify-content-center">
            <div class="loginItem">
                <RouterLink to="/auth">
                    Вход
                </RouterLink>
            </div>
            <div class="loginItem">
                <a class="loginActiveItem">
                    Регистрация
                </a>
            </div>
        </div>
        <div class="loginInputBlock">
            <br>
            <RegisterSelectorComponent v-if="selected == 0" @select="selected = $event"/>
            <RegisterEmailComponent v-if="selected == 1" @back="selected = 0" @register="register"/>
            <RegisterPhoneComponent v-if="selected == 2" @back="selected = 0" @register="register"/>
            <RegisterCodeComponent v-if="selected == 3" @code="checkCode"
                                                        @resend="resend"
                                                        v-bind:type="verificationType"
                                                        v-bind:login="login"/>
        </div>
        <div class="loginFooter">
            <span>
            Не можете войти? Напишите нам на 
            <a href="mailto:support@donorsearch.org">
                support@donorsearch.org
            </a>
            </span>
        </div>
    </div>
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

<style>
.loginBlock { 
    max-width: 460px; 
    margin: 0 auto; 
    background-color: #fff; 
    padding: 40px 50px; 
    box-shadow: 0 1px 1px #f2f2f2; 
    border-radius: 4px;
} 

.loginNav { 
    display: -webkit-flex; 
    display: -moz-box; 
    display: flex; 
    -webkit-align-items: center; 
    -moz-box-align: center; 
    align-items: center; 
    border-bottom: 1px solid rgba(182,185,193,.4);
} 

.loginInputBlock { 
    text-align: center; 
    color: #86807a;
} 

.loginFooter { 
    text-align: center; 
    border-top: 1px solid rgba(182,185,193,.4); 
    padding-top: 24px; 
    margin-top: 24px;
} 

.loginItem { 
    -webkit-flex-basis: 50%; 
    flex-basis: 50%; 
    max-width: 50%; 
    position: relative; 
    text-align: center;
} 

.loginSmall { 
    font-size: 1em; 
    line-height: 1.5; 
    text-align: center; 
    color: #828282; 
    margin: 16px 0; 
    font-weight: 400;
}  

.loginInputBlock > form  { 
    font-weight: 400;
} 

.loginFooter > span  { 
    text-align: center; 
    color: #86807a; 
    font-weight: 400;
} 

.loginActiveItem { 
    color: #000!important; 
    border-bottom: 2px solid #f7c41c;
} 

.loginItem a  { 
    font-size: 1.625em; 
    font-weight: 400; 
    line-height: 1.5; 
    padding-bottom: 10px; 
    display: block; 
    color: #5f6177;
} 

.loginInputBlock > form > div  { 
    margin-bottom: 16px;
} 

.loginFooter > span > a  { 
    color: #3892ea; 
    font-weight: 400; 
    -webkit-transition: .2s ease-in-out; 
    transition: .2s ease-in-out;
} 

.loginFooter > span > a:hover { 
    color: #4183c4;
} 
</style>