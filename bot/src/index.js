import { bot } from './bot.js';
import { redisClient } from './redis.js';

/**
 * Connects to the Redis database and starts the bot polling loop
 */
await redisClient.connect();
bot.startPolling();

/**
 * Logs a message to the console indicating that the bot is running
 */
console.log('Bot is running...');

/**
 * Registers event handlers for the SIGINT and SIGTERM signals
 * These signals are used to gracefully stop the bot
 */
// Enable graceful stop
process.once('SIGINT', () => bot.stop('SIGINT'));
process.once('SIGTERM', () => bot.stop('SIGTERM'));
