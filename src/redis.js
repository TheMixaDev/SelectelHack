import Redis from "redis";
import config from 'config';

const redisClient = Redis.createClient({
    host: config.get("redis.address").split(':')[0],
    port: config.get("redis.address").split(':')[1],
    db: config.redis.db,
    password: config.redis.password
})

redisClient.on('error', (err) => {
    console.error('Redis error:', err);
});

redisClient.on('connect', () => {
    console.log('Redis connected to', config.get('redis.address'));
});


/**
 * Check if a user is authorized based on their telegram id and user id
 * @param {string} telegramId - the telegram id of the user
 * @param {string} userId - the user id of the user
 * @returns {boolean} true if the user is authorized, false otherwise
 */
async function IsUserAuthorized(telegramId, userID) {
    const id = await redisClient.get(telegramId + ":auth");
    return id == userID;
}

/**
 * Connects a telegram user to their user id in the database
 * @param {string} telegramId - the telegram id of the user
 * @param {string} userId - the user id of the user
 */
async function AuthUserWithTg(hash, userId) {
    redisClient.set(hash + ":auth", userId);
}

/**
 * Sets the user's access token in the database
 * @param {string} hash - the unique hash of the user
 * @param {string} token - the user's access token
 */
async function setUserToken(hash, token) {
    redisClient.set(hash + ":token", token);
}

/**
 * Returns the user's access token from the database
 * @param {string} hash - the unique hash of the user
 * @returns {string} the user's access token
 */
async function GetUserToken(hash) {
    return redisClient.get(hash + ":token");
}

export { redisClient, AuthUserWithTg, IsUserAuthorized, setUserToken, GetUserToken};


