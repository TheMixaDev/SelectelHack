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
</style>