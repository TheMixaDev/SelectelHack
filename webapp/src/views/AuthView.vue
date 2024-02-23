<script setup>
import { RouterLink } from 'vue-router';
import { AuthService } from '@/services/AuthService';
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
            <div>
                <input type="text" class="loginInput" autofocus="" placeholder="Номер телефона или Email" name="username" id="username" autocomplete="off" v-model="login">
            </div>
            <div style="position:relative">
                <input type="password" class="loginInput" autocomplete="off" placeholder="Пароль" name="password" id="password" v-model="password">
                <span class="loginFooterForgot">
                Забыли? <!--TODO-->
                </span>
            </div>
            <input type="button" name="login" value="Войти" class="loginSubmit" @click="auth">
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
            }, (error) => {
                Object.values(error.response.data).flat().forEach(message => {
                    this.$notify({text: message, type: "error"});
                });
            })
        }
    }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap'); 
@import url('https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&display=swap'); 
@import url('https://fonts.googleapis.com/css?family=Inter:100,200,300,400,500,600,700,800,900&display=swap'); 
  body {  
    font-family:Inter,Arial,sans-serif!important;
    font-size:14px!important;
    font-weight:500!important;
    line-height:17px!important;
    color:#5f6177!important;
    text-align:left;
    background:#fff;
    font-style:normal!important;
  }  
* { 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
} 

* { 
    -moz-box-sizing: inherit; 
    box-sizing: inherit;
} 

* { 
    font-family: Inter,Arial,sans-serif;
} 

body { 
    margin: 0; 
    font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji; 
    font-size: 1rem; 
    font-weight: 400; 
    line-height: 1.5; 
    color: #212529; 
    text-align: left; 
    background-color: #fff;
} 

body { 
    height: 100%;
} 

body { 
    margin: 0; 
    overflow-x: hidden; 
    min-width: 320px; 
    background: #fff; 
    font-size: 14px; 
    line-height: 1.4285em; 
    color: rgba(0,0,0,.87); 
    font-smoothing: antialiased;
} 

body { 
    padding: 0; 
    font-family: Lato,Helvetica Neue,Arial,Helvetica,sans-serif;
} 

body { 
    font-family: Inter,Arial,sans-serif!important; 
    font-style: normal!important; 
    font-weight: 500!important; 
    font-size: 14px!important; 
    line-height: 17px!important; 
    color: #5f6177!important; 
    background-color: #f6f7f8!important;
} 

html { 
    font-family: sans-serif; 
    line-height: 1.15; 
    -webkit-text-size-adjust: 100%; 
    -webkit-tap-highlight-color: transparent;
} 

html { 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
} 

html { 
    line-height: 1.15; 
    -ms-text-size-adjust: 100%; 
    -webkit-text-size-adjust: 100%;
} 

html { 
    height: 100%;
} 

html { 
    font-size: 14px;
} 

html { 
    font-family: Inter,Arial,sans-serif!important; 
    font-style: normal!important; 
    font-weight: 500!important; 
    font-size: 14px!important; 
    line-height: 17px!important; 
    color: #5f6177!important; 
    background-color: #f6f7f8!important;
} 

html { 
    padding: env(safe-area-inset-top) env(safe-area-inset-right) env(safe-area-inset-bottom) env(safe-area-inset-left); 
    min-height: -webkit-calc(100% + env(safe-area-inset-top)); 
    min-height: calc(100% + env(safe-area-inset-top));
} 

.loginBlock { 
    max-width: 460px; 
    margin: 0 auto; 
    background-color: #fff; 
    padding: 40px 50px; 
    box-shadow: 0 1px 1px #f2f2f2; 
    border-radius: 4px;
} 

*,:after,:before { 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
} 

*,:after,:before { 
    -moz-box-sizing: inherit; 
    box-sizing: inherit;
} 

:selection { 
    background-color: #cce2ff; 
    color: rgba(0,0,0,.87);
} 

body ::-webkit-scrollbar { 
    -webkit-appearance: none; 
    width: 10px; 
    height: 10px;
} 

body ::-webkit-scrollbar-thumb { 
    cursor: pointer; 
    border-radius: 5px; 
    background: rgba(0,0,0,.25); 
    -webkit-transition: color .2s ease; 
    transition: color .2s ease;
} 

body ::-webkit-scrollbar-thumb:hover { 
    background: rgba(128,135,139,.8);
} 

body ::-webkit-scrollbar-track { 
    background: rgba(0,0,0,.1); 
    border-radius: 0;
} 

.d-flex { 
    display: -webkit-flex!important; 
    display: -moz-box!important; 
    display: flex!important;
} 

.justify-content-center { 
    -webkit-justify-content: center!important; 
    -moz-box-pack: center!important; 
    justify-content: center!important;
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

a { 
    color: #007bff; 
    text-decoration: none; 
    background-color: transparent;
} 

a { 
    background-color: transparent; 
    -webkit-text-decoration-skip: objects;
} 

a { 
    color: #4183c4;
} 

a { 
    text-decoration: none;
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

a:hover { 
    color: #0056b3; 
    text-decoration: underline;
} 

a,a:hover { 
    text-decoration: none;
} 

a:hover { 
    color: #1e70bf;
} 

.loginInputBlock > form > div  { 
    margin-bottom: 16px;
} 

input { 
    margin: 0; 
    font-family: inherit; 
    font-size: inherit; 
    line-height: inherit;
} 

input { 
    overflow: visible;
} 

input { 
    font-family: sans-serif; 
    font-size: 100%; 
    line-height: 1.15; 
    margin: 0;
} 

[type="submit"] { 
    -webkit-appearance: button;
} 

.loginSubmit { 
    margin: 0; 
    -webkit-transition: all .2s ease; 
    transition: all .2s ease; 
    display: -webkit-inline-flex; 
    display: -moz-inline-box; 
    display: inline-flex; 
    min-height: 42px; 
    -webkit-align-items: center; 
    -moz-box-align: center; 
    align-items: center; 
    -webkit-justify-content: center; 
    -moz-box-pack: center; 
    justify-content: center; 
    padding: 12px 20px; 
    background: #f63e3e; 
    border-radius: 4px; 
    font-weight: 400; 
    font-size: 14px; 
    line-height: 17px; 
    color: #fff; 
    border: none; 
    outline: none;
} 

[type="submit"]:not(:disabled) { 
    cursor: pointer;
} 

input:selection,textarea:selection { 
    background-color: hsla(0,0%,39.2%,.4); 
    color: rgba(0,0,0,.87);
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

img { 
    border-style: none;
} 

img { 
    vertical-align: middle;
} 

.loginInput { 
    background: #fff; 
    border: 1px solid #c1c4ca; 
    -moz-box-sizing: border-box; 
    box-sizing: border-box; 
    border-radius: 4px; 
    padding: 13px 16px; 
    outline: none; 
    width: 100%; 
    font-style: normal; 
    font-weight: 400; 
    font-size: 14px; 
    line-height: 17px; 
    letter-spacing: -.01em; 
    color: #37333f; 
    -webkit-appearance: none; 
    height: auto; 
    box-shadow: none;
} 

input[type="email"] { 
    -webkit-appearance: none; 
    -moz-appearance: none;
} 

input[type="password"] { 
    -webkit-appearance: none; 
    -moz-appearance: none;
} 

.loginFooterForgot { 
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