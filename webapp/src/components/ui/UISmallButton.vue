<template>
    <button class="button" @click="$emit('click')">
        <slot></slot>
    </button>
</template>

<script>
export default {
    name: 'UISmallButton',
    emits: ['click']
}
</script>

<style>
.button { 
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
</style>