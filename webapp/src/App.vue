<script setup>
import { RouterView } from 'vue-router'
import NotificationModal from '@/components/modal/NotificationModal.vue'
</script>

<template>
  <RouterView />
  <notifications class="p-3" position="top left">
      <template #body="props">
          <NotificationModal :data="props"/>
      </template>
  </notifications>
</template>

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

input:selection,textarea:selection { 
    background-color: hsla(0,0%,39.2%,.4); 
    color: rgba(0,0,0,.87);
} 


img { 
    border-style: none;
} 

img { 
    vertical-align: middle;
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
</style>