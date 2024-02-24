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
                Authorization: `Bearer ${token}`
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
                Authorization: `Bearer ${token}`
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
    body.city_id = data.city_id;
    body.blood_station_id = data.center_id;
    body.with_image = image.has;
    if (image.has) {
        body.image_id = image.id;
    }
    body.user_id = user.id;
    // body.first_name = user.first_name;
    // body.last_name = user.last_name;
    // body.middle_name = user.middle_name;

    if (data.id > 0) {
        body.id = data.id;
        try {
            const res = await axios.patch(`${config.get('network.api')}/donations`,
                body,
                {
                    headers: {
                        Authorization: `Bearer ${token}`
                    },
                });

            return res;
        } catch (error) {
            console.error(`Error updating donation. User hash: ${hash}, DontaionId: ${data.id}.`);
            return null;
        }
    }
    try {
        const res = await axios.post(`${config.get('network.api')}/donations`,
            body,
            {
                headers: {
                    Authorization: `Bearer ${token}`
                },

            });
        return res;
    } catch (error) {
        console.error(`Error creating donation. User hash: ${hash}, data: ${JSON.stringify(data)}.`);
        return null;
    }
}

/**
 * Creates a new plan donation
 * @param {string} hash - The user's hash
 * @param {object} data - The donation data
 * @param {object} image - The image data (has: bool, image_id: number)
 * @returns {object} The response data
 */
async function CreatePlanDonation(hash, data) {
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
    body.city_id = data.city_id;
    body.blood_station_id = data.center_id;
    body.user_id = user.id;
    // body.first_name = user.first_name;
    // body.last_name = user.last_name;
    // body.middle_name = user.middle_name;
    try {
        const res = await axios.post(`${config.get('network.api')}/donation_plan`,
            body,
            {
                headers: {
                    Authorization: `Bearer ${token}`
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
        const res = await axios.post(`${config.get('network.api')}/picture`,
            { bytes: bytes },
            {
                headers: {
                    Authorization: `Bearer ${token}`
                },

            });
        return res;
    } catch (error) {
        console.error("Error uploading file. User hash", hash)
        return null;
    }
}

/**
 * Gets a donation by its id
 * @param {string} hash - The user's hash
 * @param {number} id - The donation id
 * @returns {object} The donation data
 */
async function GetDonationsById(hash, id) {
    const token = await GetUserToken(hash);
    try {
        const res = await axios.get(`${config.get('network.api')}/donations/${id}`, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        return res;
    } catch (error) {
        console.error(`Error getting donation info. User hash: ${hash}`);
        return null;
    }
}


export { CreateDonation, GetUserInfo, GetDonations, UploadFile, GetDonationsById, CreatePlanDonation }