<script setup>
import UILargeButton from './ui/UILargeButton.vue';
</script>

<template>
    <div class="main_block">
        <div class="header_main_block" @click="toggleExtended"><span class="header_text">{{ json.title }}</span></div>
        <div class="card_container" @click="toggleExtended">
            <div class="card">
                <div class="address">{{ json.address }}</div>
                <div class="status_container">
                    <div class="offset"></div>
                    <div class="need_container">
                        <div class="need_main_block">
                            <span class="need_text">Требуется</span>
                            <div class="red_circle"></div>
                        </div>
                        <div class="need_main_block">
                            <span class="need_text">Достаточно</span>
                            <div class="green_circle"></div>
                        </div>
                    </div>
                </div>
                <div class="grid">
                    <div data-focused="false" :class="json[value] == 'need' ? 'red_main_block' : 'green_main_block'" v-for="(value, key) in blood_groups" :key="key">
                        <div class="main_block_centerer"><span class="main_block_text">{{ key }}</span></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center" v-if="extended">
            <p><b>Режим работы</b></p>
            <table class="inline-block">
                <tr v-for="day in json.schedule" :key="day.id">
                <td class="text-right pr-3">{{ day.dow }}</td>
                <td>{{ day.start }}-{{ day.end }}</td>
                </tr>
            </table>
            <p><b>Номер телефона</b></p>
            <table class="inline-block">
                <tr v-for="number in json.phone_numbers" :key="number.id">
                <td>{{ number.phone }}</td>
                </tr>
            </table>
        </div>
        <UILargeButton @click="$emit('donate', json)">Запланировать донацию</UILargeButton>
    </div>
</template>

<script>
export default {
    name: 'BloodStationComponent',
    props: ['json'],
    data() {
        return {
            blood_groups: {
                '0+': "o_plus",
                'A+': "a_plus",
                'B+': "b_plus",
                'AB+': "ab_plus",
                '0-': "o_minus",
                'A-': "a_minus",
                'B-': "b_minus",
                'AB-': "ab_minus"
            },
            extended: false
        }
    },
    methods: {
        toggleExtended() {
            this.extended = !this.extended
        }
    }
}
</script>

<style>
.main_block {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    box-shadow: rgba(37, 36, 36, 0.1) 0px 4px 24px 0px;
    background: rgb(255, 255, 255) none repeat scroll 0% 0% / auto padding-box border-box;
    border-radius: 6px;
    min-height: 383px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: all 0.2s ease-in-out 0s;
    cursor: pointer;
    padding: 16px;
    margin-right: 11px;
}

.header_main_block {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
}

.header_text {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    font-style: normal;
    font-weight: 500;
    font-size: 22px;
    line-height: 28.6px;
    color: rgb(51, 51, 51);
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
    min-height: 56px;
}

.card_container {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
}

.card {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    margin-bottom: 12px;
}

.address {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    font-style: normal;
    font-weight: 400;
    font-size: 16px;
    line-height: 19px;
    color: rgb(19, 20, 22);
    margin-bottom: 8px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    text-overflow: ellipsis;
    margin-top: 8px;
}

.status_container {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 16px;
}

.offset {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
}

.need_container {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    margin-top: auto;
}

.need_main_block {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    margin-left: auto;
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 17px;
    color: rgb(95, 97, 119);
}

.need_text {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
}

.red_circle {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    margin-left: 8px;
    width: 8px;
    height: 8px;
    border-radius: 4px;
    background-color: rgb(246, 62, 62);
}

.green_circle {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    margin-left: 8px;
    width: 8px;
    height: 8px;
    border-radius: 4px;
    background-color: rgb(39, 193, 117);
}

.grid {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    align-items: center;
    justify-content: center;
    display: flex;
    flex-wrap: wrap;
}

.green_main_block {
    width: 84px;
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    background-color: rgba(39, 193, 117, 0.1);
    border: 2px solid rgba(39, 193, 117, 0.4);
    color: rgb(39, 193, 117);
    cursor: pointer;
    flex: 1 0 20%;
    margin: 5px;
    height: 64px;
    padding: 8px;
    border-radius: 8px;
    transition: all 0.2s ease-in-out 0s;
}


.main_block_text {
    font-size: 16px;
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    font-style: normal;
    font-weight: 400;
    line-height: 20.8px;
    width: 100%;
    text-align: center;
    margin-top: 2px;
}

.red_main_block {
    width: 84px;
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    background-color: rgba(246, 62, 62, 0.1);
    border: 2px solid rgba(247, 62, 62, 0.4);
    color: rgb(246, 62, 62);
    cursor: pointer;
    flex: 1 0 20%;
    margin: 5px;
    height: 64px;
    padding: 8px;
    border-radius: 8px;
    transition: all 0.2s ease-in-out 0s;
}

.main_block_centerer {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 44px;
    width: 100%;
}
</style>