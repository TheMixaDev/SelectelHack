import { Scenes, Telegraf, session, } from 'telegraf';
import config from 'config';
import { message } from 'telegraf/filters';
import './scenes.js';
import InitScenes from './scenes.js';

const bot = new Telegraf(config.get('bot.token'), { telegram: { testEnv: false } });


const stage = new Scenes.Stage();
const authScene = new Scenes.BaseScene('authScene');
const menuScene = new Scenes.BaseScene('menuScene');
const donateScene = new Scenes.BaseScene('donateScene');
const profileScene = new Scenes.BaseScene('profileScene');
const uploadFileScene = new Scenes.BaseScene('uploadFileScene');


bot.use(session());
bot.use(stage.middleware());

stage.register(authScene, menuScene, profileScene, donateScene, uploadFileScene);

InitScenes();


bot.command('start', (ctx) => ctx.scene.enter('authScene'));

bot.on(message('text'), async (ctx) => ctx.scene.enter('authScene'));

export { bot, stage, authScene, menuScene, profileScene, donateScene, uploadFileScene, };