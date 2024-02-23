<script setup>
import { RouterLink } from 'vue-router';
import { AuthService } from '@/services/AuthService';
import UIInlineInput from '@/components/ui/UIInlineInput.vue';
import UISmallButton from '@/components/ui/UISmallButton.vue';
</script>

<template>
    <div class="loginBlock">
        <div class="loginNav d-flex justify-content-center">
            <div class="loginItem">
                <a class="loginActiveItem">
                    Вход
                </a>
            </div>
            <div class="loginItem">
                <RouterLink to="/register">
                    Регистрация
                </RouterLink>
            </div>
        </div>
        <div class="loginInputBlock">
            <div class="loginSmall">
                Email или по номеру телефона
            </div>
            <form class="" id="new_user" novalidate="">
                <UIInlineInput v-model="login" placeholder="Номер телефона или Email" type="text" property="username"/>
                <div style="position:relative">
                    <UIInlineInput v-model="password" placeholder="Пароль" type="password" property="password"/>
                    <span class="loginPasswordForgot">
                        Забыли? <!--TODO-->
                    </span>
                </div>
                <UISmallButton @click="auth" type="button">Войти</UISmallButton>
            </form>
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
import { useWebApp } from 'vue-tg';
export default {
    name: 'AuthView',
    data() {
        return {
            login: "",
            password: ""
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
                try {
                    useWebApp().sendData(JSON.stringify(
                        {
                            type: "auth",
                            data: {
                                token: token
                            },
                            hash: this.$cookies.get("hash"),
                            id: this.$cookies.get("id")
                        }
                    ));
                } catch(e) {
                    console.log(e);
                }
                this.$router.push({name: "setupProfile"});
            }, (error) => {
                Object.values(error.response.data).flat().forEach(message => {
                    this.$notify({text: message, type: "error"});
                });
            })
        }
    },
    mounted() {
        
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

.loginPasswordForgot { 
    position: absolute; 
    top: 0; 
    right: 0; 
    height: 100%; 
    display: -webkit-flex; 
    display: -moz-box; 
    display: flex; 
    -webkit-align-items: center; 
    -moz-box-align: center; 
    align-items: center; 
    -webkit-justify-content: flex-end; 
    -moz-box-pack: end; 
    justify-content: flex-end; 
    margin-right: 8px; 
    cursor: pointer; 
    color: #5f6177; 
    font-weight: 400; 
    -webkit-transition: all .2s ease-in-out; 
    transition: all .2s ease-in-out; 
    border-bottom: 1px solid transparent;
} 
</style>