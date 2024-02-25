import Redis from "redis";
import config from 'config';

/**
 * Creates a new Redis client and connects to the specified address and port
 */
const redisClient = Redis.createClient({
    host: config.get("redis.address").split(':')[0],
    port: config.get("redis.address").split(':')[1],
    db: config.redis.db,
    password: config.redis.password
})

/**
 * Event handler for when the Redis client encounters an error
 * @param {Error} err - the error that occurred
 */
redisClient.on('error', (err) => {
    console.error('Redis error:', err);
    process.exit(1);
});

/**
 * Event handler for when the Redis client connects to the server
 */
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
async function SetUserToken(hash, token) {
    redisClient.set(hash + ":token", token, {EX: 60 * 60 * 24 * 30});
}

/**
 * Returns the user's access token from the database
 * @param {string} hash - the unique hash of the user
 * @returns {string} the user's access token
 */
async function GetUserToken(hash) {
    return redisClient.get(hash + ":token");
}

/**
 * Logs out a user by deleting their access token and auth token from the database
 * @param {string} hash - the unique hash of the user
 */
async function UserLogOut(hash) {
    redisClient.del(hash + ":token");
    redisClient.del(hash + ":auth");
}


export { redisClient, AuthUserWithTg, IsUserAuthorized, SetUserToken, GetUserToken, UserLogOut};


