import { Scenes, Telegraf, session } from 'telegraf';
import config from 'config';
import HashStringWithString from './hash.js';
import { isUserAuthorized, redisClient } from './redis.js';
import { MenuKeys, ProfileKeys } from './keyboards.js';
import { message } from 'telegraf/filters';

const bot = new Telegraf(config.get('bot.token'))



const stage = new Scenes.Stage();
const authScene = new Scenes.BaseScene('authScene');
const menuScene = new Scenes.BaseScene('menuScene');

const eventScene = new Scenes.BaseScene('eventScene');
const profileScene = new Scenes.BaseScene('profileScene');

stage.register(authScene, menuScene, profileScene, eventScene);

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
    await ctx.reply('Пожалуйста, воспользуйтесь одной из кнопок ниже', {
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
    return ctx.reply('Чем могу быть полезен?', {
        reply_markup: {
            keyboard: MenuKeys,
            resize_keyboard: true,
        }
    });

});

menuScene.on(message('text'), async (ctx) => {
    switch (ctx.message.text) {
        case MenuKeys[0][0]: return ctx.reply('Что именно вы хотите сделать?', {
            reply_markup: {
                inline_keyboard: [
                    [
                        { text: '➕ Записаться на сдачу', web_app: { url: "https://github.com/nickname76/telegrambot" } },
                    ],
                    [
                        { text: '📅 Запланировать сдачу крови', web_app: { url: "https://github.com/nickname76/telegrambot" } },
                    ],
                    [
                        { text: '🏥 Найти центры сбора крови', web_app: { url: "https://github.com/nickname76/telegrambot" } },
                    ],
                    [
                        { text: '📍 Где нужна моя группа крови', web_app: { url: "https://github.com/nickname76/telegrambot" } },
                    ]
                ],
                resize_keyboard: true,
            }
        });
        case MenuKeys[0][1]: return ctx.scene.enter('eventScene');
        case MenuKeys[1][0]: return ctx.scene.enter('profileScene');
        case MenuKeys[2][0]: return ctx.reply('Памятка');
        case MenuKeys[3][0]: return ctx.reply('Donate');
        default: return ctx.reply('Пожалуйста, воспользуйтесь одной из кнопок ниже', {
            reply_markup: {
                keyboard: MenuKeys,
                resize_keyboard: true,
                one_time_keyboard: true,
            }
        });
    }
});

profileScene.enter(async (ctx) => {
    return ctx.reply('Профиль', {
        reply_markup: {
            keyboard: ProfileKeys, // todo: replace with inline keyboard
            resize_keyboard: true,
            one_time_keyboard: true
        }
    });
})

profileScene.on(message('text'), async (ctx) => {
    switch (ctx.message.text) {
        case ProfileKeys[0][0]: return ctx.reply('1000');
        case ProfileKeys[0][1]: return ctx.reply('top 1');
        case ProfileKeys[1][0]: return ctx.reply('Скоро');
        case ProfileKeys[2][0]: return ctx.reply('LIST');
        case ProfileKeys[3][0]: return ctx.scene.enter('menuScene');
        default: return ctx.reply('Воспользуйтесь одной из кнопок 👇');
    }
});



bot.command('start', (ctx) => ctx.scene.enter('authScene'));
bot.on(message('text'), async (ctx) => {
    return ctx.scene.enter('authScene');
});


await redisClient.connect();
bot.launch();




// Enable graceful stop
process.once('SIGINT', () => bot.stop('SIGINT'));
process.once('SIGTERM', () => bot.stop('SIGTERM'));
