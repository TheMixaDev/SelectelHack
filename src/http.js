import axios from "axios";
import config from "config";
import { getUserToken } from "./redis.js";

async function GetDonations(hash, page, page_size) {
    const token = await getUserToken(hash);
    const res = await axios.get(`${config.get('network.api')}/donations?page_size=${page_size}&page=${page}`, {
        headers: {
            Authorization: `Basic c2FyZWdvaDgzNkByaWNvcml0LmNvbTpzYXJlZ29oODM2QHJpY29yaXQuY29t`
        }
    });
    return res;
}

async function GetUserInfo(hash) {
    const token = await getUserToken(hash);
    const res = await axios.get(`${config.get('network.api')}/auth/me`, {
        headers: {
            Authorization: `Basic c2FyZWdvaDgzNkByaWNvcml0LmNvbTpzYXJlZ29oODM2QHJpY29yaXQuY29t`
        }
    });
    return res.data;
}

async function CreateDonation(hash, data, image) {
    const token = await getUserToken(hash);
    const user = await GetUserInfo(hash);
    const body = {}
    body.donate_at = data.date;
    body.blood_class = data.blood_type;
    body.payment_type = data.type - 0 == 0 ? 'free' : "payed";
    body.payment_cost = data.type - 0 == 0 ? 0 : Math.round(Math.random() * 800 + 700);
    body.city_id = data.city_id;
    body.blood_station_id = data.center_id;
    body.volume = 5; // !fix: idk wtf is this (gonnad be 5 liters of blood)
    body.with_image = image.has;
    if (image.has) {
        body.image_id = image.id;
    }
    body.on_moderation_date = data.date;
    body.created_using_ocr = false;
    body.first_name = user.first_name;
    body.last_name = user.last_name;
    body.middle_name = user.middle_name;

    const res = await axios.post(`${config.get('network.api')}/donations`,
        body,
        {
            headers: {
                Authorization: `Basic c2FyZWdvaDgzNkByaWNvcml0LmNvbTpzYXJlZ29oODM2QHJpY29yaXQuY29t`
            },

        });
    return res;
}

export { CreateDonation, GetUserInfo, GetDonations }