import { bot } from './bot.js';
import { redisClient } from './redis.js';


await redisClient.connect();
bot.startPolling();
console.log('Bot is running...');
// Enable graceful stop
process.once('SIGINT', () => bot.stop('SIGINT'));
process.once('SIGTERM', () => bot.stop('SIGTERM'));
