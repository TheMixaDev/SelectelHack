import { Scenes, Telegraf, session, } from 'telegraf';
import config from 'config';
import { message } from 'telegraf/filters';
import './scenes.js';
import InitScenes from './scenes.js';

/**
 * The main bot object
 */
const bot = new Telegraf(config.get('bot.token'), { telegram: { testEnv: false } });

/**
 * The bot's scene manager
 */
const stage = new Scenes.Stage();

/**
 * The bot's authentication scene
 */
const authScene = new Scenes.BaseScene('authScene');

/**
 * The bot's menu scene
 */
const menuScene = new Scenes.BaseScene('menuScene');

/**
 * The bot's donate scene
 */
const donateScene = new Scenes.BaseScene('donateScene');

/**
 * The bot's profile scene
 */
const profileScene = new Scenes.BaseScene('profileScene');

/**
 * The bot's upload file scene
 */
const uploadFileScene = new Scenes.BaseScene('uploadFileScene');

/**
 *  The bot's share status scene
 */
const shareStatusScene = new Scenes.BaseScene('shareStatusScene');

/**
 * Registers the bot's scenes with the stage
 */
bot.use(session());
bot.use(stage.middleware());
stage.register(authScene, menuScene, profileScene, donateScene, uploadFileScene, shareStatusScene);

/**
 * Initializes the bot's scenes
 */
InitScenes();

/**
 * Registers the bot's start command handler
 */
bot.command('start', (ctx) => ctx.scene.enter('authScene'));

/**
 * Registers the bot's text message handler
 */
bot.on(message('text'), async (ctx) => ctx.scene.enter('authScene'));

/**
 * Exports the bot, stage, and scenes
 */
export { bot, stage, authScene, menuScene, profileScene, donateScene, uploadFileScene, shareStatusScene};
