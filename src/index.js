import { Scenes, Telegraf, session } from 'telegraf';
import config from 'config';
import HashStringWithString from './hash.js';
import { isUserAuthorized, redisClient } from './redis.js';
import { MenuKeys } from './keyboards.js';
import { message } from 'telegraf/filters';

const bot = new Telegraf(config.get('bot.token'))



const stage = new Scenes.Stage();
const authScene = new Scenes.BaseScene('authScene');
const menuScene = new Scenes.BaseScene('menuScene');

stage.register(authScene, menuScene)

bot.use(session());
bot.use(stage.middleware());


authScene.enter(async (ctx) => {
    let hash = HashStringWithString(ctx.message.from.id, config.get('bot.secret'));
    const res = await isUserAuthorized(hash, ctx.message.from.id);
    if (res) {
        return ctx.scene.enter('menuScene');
    }

    return ctx.reply('Привет! Я DonorSearchBot. Я вижу вас впервые. Желаете войти или зарегистрироваться?', {
        reply_markup: {
            inline_keyboard: [
                [
                    { text: 'Вход', web_app: { url: "https://github.com/nickname76/telegrambot?hash=" + hash + "&id=" + ctx.message.from.id } },
                    { text: 'Регистрация', web_app: { url: "https://github.com/nickname76/telegrambot?hash=" + hash + "&id=" + ctx.message.from.id } }
                ]
            ]
        }
    });
});

authScene.on(message('text'), async (ctx) => {
    let hash = HashStringWithString(ctx.message.from.id, config.get('bot.secret'));
    await ctx.reply('Пожалуйста воспользуйтесь одной из кнопок ниже', {
        reply_markup: {
            inline_keyboard: [
                [
                    { text: 'Вход', web_app: { url: "https://github.com/nickname76/telegrambot?hash=" + hash + "&id=" + ctx.message.from.id } },
                    { text: 'Регистрация', web_app: { url: "https://github.com/nickname76/telegrambot?hash=" + hash + "&id=" + ctx.message.from.id } }
                ]
            ],
            resize_keyboard: true,
        }

    });
});



menuScene.enter(async (ctx) => {
    return ctx.reply('👋 Привет! Что вам нужно сегодня?', {
        reply_markup: {
            keyboard: MenuKeys,
            resize_keyboard: true,
        }
    });
    
});

menuScene.on(message('text'), async (ctx) => {
    switch (ctx.message.text.toLowerCase()) {
        default: return ctx.reply('Пожалуйста, воспользуйтесь одной из кнопок ниже', {
            reply_markup: {
                keyboard: MenuKeys,
                resize_keyboard: true,
            }
        });
    }
});


bot.command('end', async (ctx) => {
    ctx.reply('Пока-пока! Если я вас снова понадоблюсь нажмите на кнопку "Старт"', {
        reply_markup: {
            inline_keyboard: [[{ text: 'Старт', callback_data: 'start', }]],
            resize_keyboard: true,
        }
    });
})



bot.on('sendMessage', (ctx) => {
    console.log("HIIII");
})


bot.command('start', (ctx) => ctx.scene.enter('authScene'));
bot.on(message('text'), async (ctx) => {
    return ctx.scene.enter('authScene');
});


await redisClient.connect();
bot.launch();




// Enable graceful stop
process.once('SIGINT', () => bot.stop('SIGINT'));
process.once('SIGTERM', () => bot.stop('SIGTERM'));
