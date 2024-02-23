import { Scenes, Telegraf, session, } from 'telegraf';
import config from 'config';
import { message } from 'telegraf/filters';
import './scenes.js';
import init from './scenes.js';
import HashStringWithString from './hash.js';
import { setTgIdForUser, setUserToken } from './redis.js';
import { CreateDonation } from './http.js';

const bot = new Telegraf(config.get('bot.token'), { telegram: { testEnv: false } });


const stage = new Scenes.Stage();
const authScene = new Scenes.BaseScene('authScene');
const menuScene = new Scenes.BaseScene('menuScene');
const donateScece = new Scenes.BaseScene('donateScene');
const profileScene = new Scenes.BaseScene('profileScene');
const eventScene = new Scenes.BaseScene('eventScene');

stage.register(authScene, menuScene, profileScene, eventScene, donateScece);

init();

bot.use(session());
bot.use(stage.middleware());


bot.command('start', (ctx) => ctx.scene.enter('authScene'));
bot.on(message('web_app_data'), async (ctx) => {
    const { type, data, hash, id } = JSON.parse(ctx.message.web_app_data.data);
    console.log(id, hash, type)
    if (hash !== HashStringWithString(id - 0, config.get('bot.secret'))) {
        return ctx.reply('Ошибка авторизации.');
    }
    if (type == 'auth') {
        setTgIdForUser(hash, id);
        setUserToken(hash, data.token);
        await ctx.reply('Вы успешно авторизовались!');
        return ctx.scene.enter('menuScene');
    } else if (type == 'add_donation') {
        const hash = HashStringWithString(id - 0, config.get('bot.secret'));
        if (data.document == 1) {
            const res = await CreateDonation(hash, data, { has: false, id: 0 });
            if (res.status == 200) {
                return ctx.reply('🎉 Донация успешно добавлена!');
            };
            return ctx.reply("😢 Произошла ошибка при добавлении донации. Попробуйте еще раз.");
        } else {
            return ctx.reply('😵 ПЛАКАЛИ ВСЕМ ПОДЪЕЗДОМ! 😵'); // todo: 
        }
    }
})

bot.on(message('text'), async (ctx) => ctx.scene.enter('authScene'));

export { bot, stage, authScene, menuScene, eventScene, profileScene, donateScece };