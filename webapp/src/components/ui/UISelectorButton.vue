<template>
    <div :class="['selector', active ? 'active' : '']">
        <label for="free">
            <div class="check_text">
            <span>
                {{ name }}
            </span>
            <span>
                <slot></slot>
            </span>
            </div>
        </label>
    </div>
</template>

<script>
export default {
    name: 'UISelectorButton',
    props: ['name', 'active']
}
</script>

<style>
div > label  { 
    cursor: pointer;
} 

.selector {
    transition: .3s;
    cursor: pointer;
    background: #fff; 
    border-radius: 4px; 
    min-height: 111px; 
    position: relative; 
    padding: 16px;
    -moz-box-sizing: border-box; 
    box-sizing: border-box; 
    border-radius: 4px; 
    position: relative;
    border: 1px solid lightgray; 
} 

.active { 
    border: 1px solid #f73e3e; 
}
.active > label::before {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 2;
    width: 18px;
    height: 18px;
    text-align: center;
    cursor: pointer;
    color: #f73e3e;
    content: "◉";
}

.check_text  { 
    display: -webkit-flex; 
    display: -moz-box; 
    display: flex; 
    -webkit-flex-direction: column; 
    -moz-box-orient: vertical; 
    -moz-box-direction: normal; 
    flex-direction: column;
} 

.selector .check_text > span  { 
    font-weight: 400; 
    font-size: 12px; 
    line-height: 150%; 
    letter-spacing: -.01em; 
    color: #5f6177;
} 

.selector .check_text > span:first-child  { 
    font-weight: 500; 
    font-size: 16px; 
    line-height: 20px; 
    letter-spacing: -.01em; 
    color: #37333f; 
    margin-bottom: 8px;
} 

.selector .check_text > span:last-child  { 
    font-weight: 400; 
    font-size: 12px; 
    line-height: 150%; 
    letter-spacing: -.01em; 
    color: #5f6177;
} 

</style>