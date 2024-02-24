import axios from "axios";
import config from "config";
import { GetUserToken } from "./redis.js";

/**
 * Get the donations of a user
 * @param {string} hash - The user's hash
 * @param {number} page - The page number
 * @param {number} page_size - The page size
 * @returns {object} The response data
 */
async function GetDonations(hash, page, page_size) {
    const token = await GetUserToken(hash);
    try {
        const res = await axios.get(`${config.get('network.api')}/donations?page_size=${page_size}&page=${page}`, {
            headers: {
                Authorization: `Basic c2FyZWdvaDgzNkByaWNvcml0LmNvbTpzYXJlZ29oODM2QHJpY29yaXQuY29t`
            }
        });
        return res;
    } catch (error) {
        console.error(`Error getting donation info. User hash: ${hash}`);
        return null;
    }
}

/**
 * Get the user info based on the user's hash
 * @param {string} hash - The user's hash
 * @returns {object} The user info
 */
async function GetUserInfo(hash) {
    const token = await GetUserToken(hash);
    try {
        const res = await axios.get(`${config.get('network.api')}/auth/me`, {
            headers: {
                Authorization: `Basic c2FyZWdvaDgzNkByaWNvcml0LmNvbTpzYXJlZ29oODM2QHJpY29yaXQuY29t`
            }
        });
        return res;
    } catch (error) {
        console.error(`Error getting user info. User hash: ${hash}.`);
        return null;
    }
}

/**
 * Creates a new donation
 * @param {string} hash - The user's hash
 * @param {object} data - The donation data
 * @param {object} image - The image data (has: bool, image_id: number)
 * @returns {object} The response data
 */
async function CreateDonation(hash, data, image) {
    const token = await GetUserToken(hash);
    let user = await GetUserInfo(hash);
    if (!user) {
        return null;
    }
    user = user.data;
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

    try {
        const res = await axios.post(`${config.get('network.api')}/donations`,
            body,
            {
                headers: {
                    Authorization: `Basic c2FyZWdvaDgzNkByaWNvcml0LmNvbTpzYXJlZ29oODM2QHJpY29yaXQuY29t`
                },

            });
        return res;
    } catch (error) {
        console.error(`Error creating donation. User hash: ${hash}, data: ${JSON.stringify(data)}.`);
        return null;
    }
}

/**
 * Uploads a file to the server
 * @param {string} hash - The user's hash
 * @param {Uint8Array} bytes - The file data
 * @returns {object} The response data (image id or error)
 */
async function UploadFile(hash, bytes) {
    const token = await GetUserToken(hash);
    try {
        const res = await axios.post(`${config.get('network.api')}/files`,
            { bytes: bytes },
            {
                headers: {
                    Authorization: `Basic c2FyZWdvaDgzNkByaWNvcml0LmNvbTpzYXJlZ29oODM2QHJpY29yaXQuY29t`
                },

            });
        return res;
    } catch (error) {
        console.error("Error uploading file. User hash", hash)
        return null;
    }
}

export { CreateDonation, GetUserInfo, GetDonations, UploadFile }