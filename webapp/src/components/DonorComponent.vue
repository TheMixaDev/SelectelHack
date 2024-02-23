<template>
    <div class="main_block">
        <div class="header_main_block"><span class="header_text">{{ json.first_name }} {{ json.last_name }}</span></div>
        <div class="card_container">
            <div class="card">
                <div style="display: flex; align-items: center;">
                  <img :src="json.photo?.medium" style="margin-right: 10px;">
                  <div>
                    <div class="">Донаций: {{ json.donation_agg.count }}</div>
                    <div class="" v-if="json.donor_status">Статус донора: {{ json.donor_status?.name }}</div>
                    <div class="" v-if="json.city">Город: {{ json.city?.title }}</div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'DonorComponent',
    props: ['json']
}
</script>

<style>
img {
    width: 150px;
    height: auto;
}
.main_block {
    font-family: Inter, Arial, sans-serif;
    box-sizing: border-box;
    box-shadow: rgba(37, 36, 36, 0.1) 0px 4px 24px 0px;
    background: rgb(255, 255, 255) none repeat scroll 0% 0% / auto padding-box border-box;
    border-radius: 6px;
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