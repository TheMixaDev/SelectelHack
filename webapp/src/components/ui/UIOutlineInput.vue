<template>
    <div class="mb-3 d-flex justify-content-between align-items-center style-EOhow" id="style-EOhow">
        <label :for="property">
        <slot></slot>
        </label>
        <div class="text-left ml-3 w-75">
        <input class="input" autocomplete="off" :type="type" :name="property" :id="property" :value="modelValue" @input="$emit('update:modelValue', $event.target.value)">
        <div class="mt-2" v-if="tip.length > 0">
            {{ tip }}
        </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'UIOutlineInput',
    props: ['property', 'type', 'modelValue', 'tip'],
    emits: ['update:modelValue']
}
</script>

<style>
</style>