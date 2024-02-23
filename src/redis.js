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
async function isUserAuthorized(telegramId, userID) {
    // redisClient.set(telegramId + ":auth", userID);
    const id = await redisClient.get(telegramId + ":auth");
    return id == userID;
}

/**
 * Connects a telegram user to their user id in the database
 * @param {string} telegramId - the telegram id of the user
 * @param {string} userId - the user id of the user
 */
async function setTgIdForUser(hash, userId) {
    redisClient.set(hash + ":auth", userId);
}

async function setUserToken(hash, token) {
    redisClient.set(hash + ":token", token);
}

async function getUserToken(hash) {
    return redisClient.get(hash + ":token");
}

export { redisClient, setTgIdForUser, isUserAuthorized, setUserToken, getUserToken};


