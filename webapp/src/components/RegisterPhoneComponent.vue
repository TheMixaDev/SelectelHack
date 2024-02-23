<template>
    <div class="loginBack">
        <div>
            <a @click="$emit('back')">
                <i class="zmdi zmdi-arrow-left mr-2">
                </i>
                Назад
            </a>
        </div>
    </div>
    <div class="loginSignupHeader">
        <h2>
        Регистрация по телефону
        </h2>
    </div>
    <form class="" id="registration">
    <div class="mb-3 d-flex justify-content-between align-items-center">
        <label for="email">
        Телефон*
        </label>
        <div class="text-left ml-3 w-75">
        <input class="loginInput" placeholder="+7 (___) ___-__-__" type="tel" name="phone" id="phone" autocomplete="off" v-model="phone">
        <div class="mt-2">
            Регистрация по номеру телефона может быть доступна только для абонентов РФ
        </div>
        </div>
    </div>
    <div class="mb-3 d-flex justify-content-between align-items-center style-EOhow" id="style-EOhow">
        <label for="password">
        Пароль*
        </label>
        <div class="text-left ml-3 w-75">
        <input class="loginInput" autocomplete="off" placeholder="" type="password" name="password" id="password" v-model="password">
        <div class="mt-2">
            Пароль должен содержать минимум 8 символов и состоять из цифр и букв
        </div>
        </div>
    </div>
    <div class="mb-3 d-flex justify-content-between align-items-center style-eh1WW" id="style-eh1WW">
        <label for="first_name">
        Имя*
        </label>
        <div class="text-left ml-3 w-75">
        <input class="loginInput" autocomplete="off" placeholder="" type="text" name="first_name" id="first_name" v-model="name">
        </div>
    </div>
    <input type="button" class="loginSubmit loginSubmitRed" value="Зарегистрироваться" @click="$emit('register', phone, password, name)">
    </form>
</template>

<script>
export default {
    name: 'RegisterPhoneComponent',
    emits: ['back'],
    data() {
        return {
            phone: "",
            password: "",
            name: ""
        }
    }
}
</script>

<style>
.loginSignupHeader > h2  { 
    font-weight: 400; 
    margin: 16px 0;
} 

.justify-content-between { 
    -webkit-justify-content: space-between!important; 
    -moz-box-pack: justify!important; 
    justify-content: space-between!important;
} 

.align-items-center { 
    -webkit-align-items: center!important; 
    -moz-box-align: center!important; 
    align-items: center!important;
} 

.mb-3 { 
    margin-bottom: 1rem!important;
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

.loginSubmitRed { 
    background-color: #f63e3e; 
    width: 100%;
} 

input:selection,textarea:selection { 
    background-color: hsla(0,0%,39.2%,.4); 
    color: rgba(0,0,0,.87);
} 

.mr-2 { 
    margin-right: .5rem!important;
} 

label { 
    display: inline-block; 
    margin-bottom: .5rem;
} 

.w-75 { 
    width: 75%!important;
} 

.ml-3 { 
    margin-left: 1rem!important;
} 

.text-left { 
    text-align: left!important;
} 

.mt-2 { 
    margin-top: .5rem!important;
} 

/* These were inline style tags. Uses id+class to override almost everything */
#style-EOhow.style-EOhow {  
   position: relative;  
}  
#style-eh1WW.style-eh1WW {  
   position: relative;  
}  

</style>