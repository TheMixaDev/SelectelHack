import { authScene, donateScece, menuScene, profileScene } from "./bot.js";
import { message } from 'telegraf/filters';
import HashStringWithString from "./hash.js";
import config from 'config';
import { MenuKeys, ProfileKeys } from "./keyboards.js";
import { getUserToken, isUserAuthorized } from "./redis.js";
import { GetDonations } from "./http.js";

function init() {
    authScene.enter(async (ctx) => {
        let hash = HashStringWithString(ctx.message.from.id, config.get('bot.secret'));
        const res = await isUserAuthorized(hash, ctx.message.from.id);

        if (res) {
            return ctx.scene.enter('menuScene');
        }

        return ctx.reply('Привет! Я DonorSearchBot. Я вижу вас впервые. Желаете войти или зарегистрироваться?', {
            reply_markup: {
                keyboard: [
                    [
                        { text: 'Вход', web_app: { url: `${config.get('network.webapp')}?path=auth&hash=${hash}&id=${ctx.message.from.id}&time=${new Date().getTime()}` } },
                        { text: 'Регистрация', web_app: { url: `${config.get('network.webapp')}?path=register&hash=${hash}&id=${ctx.message.from.id}&time=${new Date().getTime()}` } }
                    ]
                ],
                resize_keyboard: true,
            }
        });
    });


    authScene.on(message('text'), async (ctx) => {
        const hash = HashStringWithString(ctx.message.from.id, config.get('bot.secret'));
        await ctx.reply('Пожалуйста, воспользуйтесь одной из кнопок ниже', {
            reply_markup: {
                keyboard: [
                    [
                        { text: 'Вход', web_app: { url: `${config.get('network.webapp')}?path=auth&hash=${hash}&id=${ctx.message.from.id}&time=${new Date().getTime()}` } },
                        { text: 'Регистрация', web_app: { url: `${config.get('network.webapp')}?path=register&hash=${hash}&id=${ctx.message.from.id}&time=${new Date().getTime()}` } }
                    ]
                ],
                resize_keyboard: true,
            }

        });
    });



    menuScene.enter(async (ctx) => {
        return ctx.reply('Чем могу быть полезен?', {
            reply_markup: {
                keyboard: [
                    [
                        { text: '🩸 Сдача крови' },
                        { text: '🗓️ События' },
                    ],
                    [{ text: '👤 Мой профиль' }],
                    [{ text: '📖 Памятка к сдаче крови', web_app: { url: `https://donorsearch.org/how/`}},],
                    [{ text: '❤️ Поддержать проект' }] // todo: donation
                ],
                resize_keyboard: true,
            }
        });

    });

    menuScene.on(message('text'), async (ctx) => {
        switch (ctx.message.text) {
            case MenuKeys[0][0]: return ctx.scene.enter('donateScene');
            case MenuKeys[0][1]: return ctx.scene.enter('eventScene');
            case MenuKeys[1][0]: return ctx.scene.enter('profileScene');
            case MenuKeys[2][0]: return
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

    donateScece.enter(async (ctx) => {
        const id = ctx.message.from.id
        const hash = HashStringWithString(id - 0, config.get('bot.secret'));
        const token = await getUserToken(hash);
        return ctx.reply('Что именно вы хотите сделать?', {
            reply_markup: {
                keyboard: [
                    [
                        { text: '➕ Записаться на сдачу', web_app: { url: `${config.get('network.webapp')}?path=donation/create&hash=${hash}&token=${token}&id=${ctx.message.from.id}&time=${new Date().getTime()}` } },
                    ],
                    [
                        { text: '📅 Запланировать сдачу крови', web_app: { url: `${config.get('network.webapp')}?path=donation/plan&token=${token}&hash=${hash}&id=${ctx.message.from.id}&time=${new Date().getTime()}` } },
                    ],
                    [
                        { text: '📍 Где нужна моя группа крови', web_app: { url: `${config.get('network.webapp')}?path=stations&token=${token}&hash=${hash}&id=${ctx.message.from.id}&time=${new Date().getTime()}` } },
                    ],
                    [
                        { text: '🚪 Назад в меню', }
                    ]
                ],
                resize_keyboard: true,
                one_time_keyboard: true
            }
        });
    });


    donateScece.on(message('text'), async (ctx) => {
        switch (ctx.message.text) {
            case '🚪 Назад в меню': return ctx.scene.enter('menuScene');
            default: return ctx.reply('Воспользуйтесь одной из кнопок 👇');
        }
    });


    profileScene.enter(async (ctx) => {
        return ctx.reply('Профиль', {
            reply_markup: {
                keyboard: ProfileKeys,
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
            case ProfileKeys[2][0]:
                const hash = HashStringWithString(ctx.message.from.id, config.get('bot.secret'));
                const res = await GetDonations(hash, 1, 99)
                if (res.status == 200) {
                    // todo: parse donations
                    return ctx.reply(`Ваши донации:\n${JSON.stringify(res.data)}`);
                }
                return ctx.reply("😢 Произошла ошибка при получении донации. Попробуйте еще раз.");
            case ProfileKeys[3][0]: return ctx.scene.enter('menuScene');
            default: return ctx.reply('Воспользуйтесь одной из кнопок 👇');
        }
    });
}

export default init;