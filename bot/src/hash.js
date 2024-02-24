import CryptoJS from "crypto-js";

/**
 * Computes the HMAC-SHA256 hash of a string message using a secret key.
 *
 * @param {string} msg - The message to hash.
 * @param {string} key - The secret key.
 * @returns {string} The HMAC-SHA256 hash of the message.
 */
function HashStringWithString(msg, key) {
    return CryptoJS.HmacSHA256(msg, key).toString();
}

export default HashStringWithString;