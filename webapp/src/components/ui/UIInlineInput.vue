<template>
    <div>
        <input
        :type="type"
        class="input"
        :placeholder="placeholder"
        :name="property"
        :id="property"
        autocomplete="off"
        @input="$emit('update:modelValue', $event.target.value)"
        :value="modelValue">
    </div>
</template>

<script>
export default {
    name: 'UIInlineInput',
    props: ['placeholder', 'property', 'type', 'modelValue'],
    emits: ['update:modelValue']
}
</script>

<style>
.input { 
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
    height: auto; 
    box-shadow: none;
}
</style>