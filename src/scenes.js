import { authScene, donateScece, menuScene, profileScene, uploadFileScene } from "./bot.js";
import { message } from 'telegraf/filters';
import HashStringWithString from './hash.js';
import { AuthUserWithTg, SetUserToken, UserLogOut } from './redis.js';
import { CreateDonation, GetDonationsById, UploadFile } from './http.js';
import config from 'config';
import { GetUserToken, IsUserAuthorized } from "./redis.js";
import { GetDonations, GetUserInfo } from "./http.js";
import { GenerateLink, ImageUrlToByteArray, PrettyBloodGroup } from "./utils.js";
import buttonTexts from "../assets/button_text.json";

/**
 * Initialize the different scenes of the bot
 */
function InitScenes() {
    authScene.enter(async (ctx) => {
        const id = ctx.message.from.id - 0;
        const hash = HashStringWithString(id, config.get('bot.secret'));
        const res = await IsUserAuthorized(hash, id);
        if (res) {
            return ctx.scene.enter('menuScene');
        }

        return ctx.reply(buttonTexts.greeting, {
            reply_markup: {
                keyboard: [
                    [
                        { text: buttonTexts.login, web_app: { url: GenerateLink(config.get('network.webapp'), 'auth', hash, id) } },
                        { text: buttonTexts.register, web_app: { url: GenerateLink(config.get('network.webapp'), 'register', hash, id) } }
                    ]
                ],
                resize_keyboard: true,
            }
        });
    });


    authScene.on(message('text'), async (ctx) => {
        const id = ctx.message.from.id - 0;
        const hash = HashStringWithString(id, config.get('bot.secret'));
        await ctx.reply('Пожалуйста, воспользуйтесь одной из кнопок ниже', {
            reply_markup: {
                keyboard: [
                    [
                        { text: buttonTexts.login, web_app: { url: GenerateLink(config.get('network.webapp'), 'auth', hash, id) } },
                        { text: buttonTexts.register, web_app: { url: GenerateLink(config.get('network.webapp'), 'register', hash, id) } }
                    ]
                ],
                resize_keyboard: true,
            }

        });
    });

    authScene.on(message('web_app_data'), async (ctx) => {
        const { data, hash, id } = JSON.parse(ctx.message.web_app_data.data);
        if (hash !== HashStringWithString(id - 0, config.get('bot.secret'))) {
            return ctx.reply('Ошибка авторизации.');
        }
        AuthUserWithTg(hash, id);
        SetUserToken(hash, data.token);
        await ctx.reply('Вы успешно авторизовались!');
        return ctx.scene.enter('menuScene');
    })



    menuScene.enter(async (ctx) => {
        const id = ctx.message.from.id - 0;
        const hash = HashStringWithString(id, config.get('bot.secret'));
        const token = await GetUserToken(hash);
        if (!token) {
            return ctx.scene.enter('authScene');
        }
        return ctx.reply('Чем могу быть полезен?', {
            reply_markup: {
                keyboard: [
                    [
                        { text: buttonTexts.donateBlood },
                        { text: buttonTexts.events, web_app: { url: GenerateLink(config.get('network.webapp'), 'events', '', '', '') } },
                    ],
                    [{ text: buttonTexts.profile }, { text: buttonTexts.updateProfile, web_app: { url: GenerateLink(config.get('network.webapp'), 'profile/setup', hash, id, token) } },],
                    [{ text: buttonTexts.guide, web_app: { url: GenerateLink(config.get('network.webapp'), 'static/howto', '', '', '') } },],
                    [{ text: buttonTexts.donate }],
                    [{ text: buttonTexts.exitAccount }]
                ],
                resize_keyboard: true,
                one_time_keyboard: true,
            }
        });

    });

    menuScene.on(message('text'), async (ctx) => {
        const id = ctx.message.from.id - 0;
        const hash = HashStringWithString(id, config.get('bot.secret'));
        const token = await GetUserToken(hash);
        if (!token) {
            return ctx.scene.enter('authScene');
        }
        switch (ctx.message.text) {
            case buttonTexts.donateBlood: return ctx.scene.enter('donateScene');
            case buttonTexts.exitAccount:
                await UserLogOut(hash);
                return ctx.scene.enter('authScene');
            case buttonTexts.profile: return ctx.scene.enter('profileScene');
            case buttonTexts.donate: return ctx.reply('Какую сумму вы хотите пожертвовать нашему проекту?', {
                reply_markup: {
                    keyboard: [['100 RUB ', '150 RUB', '200 RUB'], ['500 RUB', '1000 RUB', '2000 RUB'], [buttonTexts.backToMenu,]],
                    resize_keyboard: true,
                    one_time_keyboard: true,
                }
            });
            default: return ctx.reply('Пожалуйста, воспользуйтесь одной из кнопок ниже', {
                reply_markup: {
                    keyboard: [
                        [
                            { text: buttonTexts.donateBlood },
                            { text: buttonTexts.events, web_app: { url: GenerateLink(config.get('network.webapp'), 'events', '', '', '') } },
                        ],
                        [{ text: buttonTexts.profile }, { text: buttonTexts.updateProfile, web_app: { url: GenerateLink(config.get('network.webapp'), 'profile/setup', hash, id, token) } },],
                        [{ text: buttonTexts.guide, web_app: { url: GenerateLink(config.get('network.webapp'), 'static/howto', '', '', '') } },],
                        [{ text: buttonTexts.donate }],
                        [{ text: buttonTexts.exitAccount }]
                    ],
                    resize_keyboard: true,
                    one_time_keyboard: true,
                }
            });
        }
    });

    menuScene.on(message('web_app_data'), async (ctx) => {
        const { type, hash, id, token } = JSON.parse(ctx.message.web_app_data.data);
        if (hash !== HashStringWithString(id - 0, config.get('bot.secret'))) {
            return ctx.reply('Ошибка авторизации.');
        }

        if (type == "update") {
            return ctx.reply('✅ Вы успешно обновили свой профиль!');
        }
    });

    donateScece.enter(async (ctx) => {
        const id = ctx.message.from.id - 0;
        const hash = HashStringWithString(id, config.get('bot.secret'));
        const token = await GetUserToken(hash);
        if (!token) {
            return ctx.scene.enter('authScene');
        }
        return ctx.reply('Что именно вы хотите сделать?', {
            reply_markup: {
                keyboard: [
                    [
                        { text: buttonTexts.donateAppointment, web_app: { url: GenerateLink(config.get('network.webapp'), 'donation/create', hash, id, token) } },
                    ],
                    [
                        { text: buttonTexts.planBloodDonation, web_app: { url: GenerateLink(config.get('network.webapp'), 'donation/plan', hash, id, token) } },
                    ],
                    [
                        { text: buttonTexts.findBloodType, web_app: { url: GenerateLink(config.get('network.webapp'), 'stations', hash, id, token) } },
                    ],
                    [
                        { text: buttonTexts.backToMenu, }
                    ]
                ],
                resize_keyboard: true,
                one_time_keyboard: true
            }
        });
    });


    donateScece.on(message('text'), async (ctx) => {
        switch (ctx.message.text) {
            case buttonTexts.backToMenu: return ctx.scene.enter('menuScene');
            default: return ctx.reply('Воспользуйтесь одной из кнопок 👇');
        }
    });

    donateScece.on(message('web_app_data'), async (ctx) => {
        const { type, data, hash, id } = JSON.parse(ctx.message.web_app_data.data);
        if (hash !== HashStringWithString(id - 0, config.get('bot.secret'))) {
            return ctx.reply('Ошибка авторизации.');
        }
        if (type == 'add_donation') {
            if (data.document == 1) {
                const res = await CreateDonation(hash, data, { has: false, id: 0 });
                if (!res) {
                    console.log(`Error creating donation. UserHash: ${hash}, Status: ${res.status}`);
                    return ctx.reply('Ошибка добавления донации.');
                }
                if (res.status == 200) {
                    return ctx.reply('🎉 Донация успешно добавлена!');
                };
                console.error(`Error creating donation. UserHash: ${hash}, Status: ${res.status}`);
                return ctx.reply("😢 Произошла ошибка при добавлении донации. Попробуйте еще раз.");
            } else {
                // Move user to uploading file + save state to session
                ctx.session = { data: data }
                return ctx.scene.enter('uploadFileScene');
            }
        } else if (type == 'update_donation') {
            // Getting old donation
            const old = await GetDonationsById(hash, data.id);
            if (!old) {
                console.error(`Error updating donation. UserHash: ${hash}, Status: ${old.status}`);
                return ctx.reply("😢 Произошла ошибка при обновлении донации. Попробуйте еще раз.");
            }
            // if old donation has no image and new donation has image -> ask user to upload new image
            if (!old.data.with_image && data.document == 0) {
                ctx.session = { data: data }
                return ctx.scene.enter('uploadFileScene');
            }

            // else update donation
            const res = await CreateDonation(hash, data, { has: old.data.with_image, id: old.data.image_id });
            if (!res) {
                console.log(`Error updating donation. UserHash: ${hash}, Status: ${res.status}`);
                return ctx.reply('Ошибка обновления донации.');
            }

            if (res.status == 200) {
                return ctx.reply('🎉 Донация успешно обновлена!');
            };

            console.error(`Error updating donation. UserHash: ${hash}, Status: ${res.status}`);
            return ctx.reply("😢 Произошла ошибка при обновлении донации. Попробуйте еще раз.");
        } else if (type == "plan_donation") {
            return ctx.reply('🕒 Донация успешно запланирована!');
        }
    })

    uploadFileScene.enter(async (ctx) => {
        return ctx.reply('Пожалуйста, загрузите изображение', {
            reply_markup: {
                keyboard: [
                    [{ text: buttonTexts.backToMenu }]
                ],
                resize_keyboard: true,
                one_time_keyboard: true
            }
        });
    });

    uploadFileScene.on(message('photo'), async (ctx) => {
        return ctx.reply('😵‍💫 Пожалуйста, загрузите изображение без сжатия (документ)', {
            reply_markup: {
                keyboard: [
                    [{ text: buttonTexts.backToMenu }]
                ],
                resize_keyboard: true,
                one_time_keyboard: true
            }
        });
    })

    uploadFileScene.on(message('document'), async (ctx) => {
        const file = ctx.message.document;

        if (file.mime_type != 'image/jpeg' && file.mime_type != 'image/png') {
            return ctx.reply('🖼️ Файл должен быть изображением!');
        }

        // Retrieve file link from Telegram
        const link = await ctx.telegram.getFileLink(file.file_id);

        const id = ctx.message.from.id - 0;
        const hash = HashStringWithString(id, config.get('bot.secret'));

        // Convert image to byte array
        const bytes = await ImageUrlToByteArray(link.href);

        // Upload image to database
        const uploadRes = await UploadFile(hash, bytes);
        if (!uploadRes) {
            console.error(`Error uploading file. UserId: ${ctx.message.from}`);
            await ctx.reply('🎉 Донация успешно добавлена!',);
            return ctx.scene.enter('menuScene');
            // return ctx.reply('📛 Ошибка загрузки файла!');
        }

        // if success -> retrieve id from response and use it for creating donation
        if (uploadRes.status == 200) {
            const res = await CreateDonation(hash, ctx.session.data, { has: true, id: uploadRes.data.id });
            if (!res) {
                console.error(`Error creating donation. UserId: ${ctx.message.from.id}, Status: ${res.status}`);
                return ctx.reply('☹️ Ошибка добавления донации. Попробуйте еще раз.');
            }

            if (res.status == 200) {
                await ctx.reply('🎉 Донация успешно добавлена!',);
                return ctx.scene.enter('menuScene');
            } else {
                console.error(`Error creating donation. UserId: ${ctx.message.from.id}, Status: ${res.status}`);
                return ctx.reply('☹️ Ошибка добавления донации. Попробуйте еще раз.');
            }
        };
    });

    uploadFileScene.on(message('text'), async (ctx) => {
        switch (ctx.message.text) {
            case buttonTexts.backToMenu: return ctx.scene.enter('menuScene');
            default: return ctx.reply('Пожалуйста, загрузите изображение или вернитесь в меню', {
                reply_markup: {
                    keyboard: [
                        [{ text: buttonTexts.backToMenu }]
                    ],
                    resize_keyboard: true,
                    one_time_keyboard: true
                }
            });
        }
    });


    profileScene.enter(async (ctx) => {
        const id = ctx.message.from.id - 0;
        const hash = HashStringWithString(id, config.get('bot.secret'));
        const token = await GetUserToken(hash);
        if (!token) {
            return ctx.scene.enter('authScene');
        }
        let usr = await GetUserInfo(hash)
        if (!usr) {
            console.error(`Error to get user info. UserHash: ${hash}.`);
            return ctx.reply('Профиль', {
                reply_markup: {
                    keyboard: [
                        [
                            { text: buttonTexts.bonusPoints, web_app: { url: GenerateLink(config.get('network.webapp'), 'bonuses', hash, id, token) } },
                            { text: buttonTexts.donorRating, web_app: { url: GenerateLink(config.get('network.webapp'), 'top', hash, id, token) } },
                        ],
                        [{ text: buttonTexts.honoraryDonorStatus },],
                        [{ text: buttonTexts.myDonations, web_app: { url: GenerateLink(config.get('network.webapp'), 'donations', hash, id, token) } },],
                        [{ text: buttonTexts.backToMenu }]
                    ],
                    resize_keyboard: true,
                    one_time_keyboard: true
                }
            });
        }
        usr = usr.data;
        let formattedString = `Ваш профиль:\n> Имя: ${usr.first_name}\n> Дата рождения: ${usr.birth_date}\n> Email: ${usr.email}\n> Город: ${usr.city.title}\n> Группа крови: ${PrettyBloodGroup(usr.blood_group)}`;
        return ctx.reply(formattedString, {
            reply_markup: {
                keyboard: [
                    [
                        { text: buttonTexts.bonusPoints, web_app: { url: GenerateLink(config.get('network.webapp'), 'bonuses', hash, id, token) } },
                        { text: buttonTexts.donorRating, web_app: { url: GenerateLink(config.get('network.webapp'), 'top', hash, id, token) } },
                    ],
                    [{ text: buttonTexts.honoraryDonorStatus },],
                    [{ text: buttonTexts.myDonations, web_app: { url: GenerateLink(config.get('network.webapp'), 'donation', hash, id, token) } },],
                    [{ text: buttonTexts.backToMenu }]
                ],
                resize_keyboard: true,
                one_time_keyboard: true
            }
        });
    });

    profileScene.on(message('text'), async (ctx) => {
        const id = ctx.message.from.id - 0;
        switch (ctx.message.text) {
            case buttonTexts.honoraryDonorStatus:
                var hash = HashStringWithString(id, config.get('bot.secret'));
                var usr = await GetUserInfo(hash)
                var token = await GetUserToken(hash);
                if (!token) {
                    return ctx.scene.enter('authScene');
                }
                if (!usr) {
                    return ctx.reply('😔 Не удалось получить информацию о вашем статусе.', {
                        reply_markup: {
                            keyboard: [
                                [
                                    { text: buttonTexts.bonusPoints, web_app: { url: GenerateLink(config.get('network.webapp'), 'bonuses', hash, id, token) } },
                                    { text: buttonTexts.donorRating, web_app: { url: GenerateLink(config.get('network.webapp'), 'top', hash, id, token) } },
                                ],
                                [{ text: buttonTexts.honoraryDonorStatus },],
                                [{ text: buttonTexts.myDonations, web_app: { url: GenerateLink(config.get('network.webapp'), 'donation', hash, id, token) } },],
                                [{ text: buttonTexts.backToMenu }]
                            ],
                            resize_keyboard: true,
                            one_time_keyboard: true
                        }
                    });
                }
                const donorStatusName = usr.data?.donor_status?.name;
                const donationsCount = usr.data?.donor_status?.donations_count;

                const str = `👑 Ваш статус донорства: ${donorStatusName ? donorStatusName : 'аноним'} (${donationsCount ? donationsCount : 0} донаций)`;
                return ctx.reply(str, {
                    reply_markup: {
                        keyboard: [
                            [
                                { text: buttonTexts.bonusPoints, web_app: { url: GenerateLink(config.get('network.webapp'), 'bonuses', hash, id, token) } },
                                { text: buttonTexts.donorRating, web_app: { url: GenerateLink(config.get('network.webapp'), 'top', hash, id, token) } },
                            ],
                            [{ text: buttonTexts.honoraryDonorStatus },],
                            [{ text: buttonTexts.myDonations, web_app: { url: GenerateLink(config.get('network.webapp'), 'donation', hash, id, token) } },],
                            [{ text: buttonTexts.backToMenu }]
                        ],
                        resize_keyboard: true,
                        one_time_keyboard: true
                    }
                });
            case buttonTexts.myDonations:
                var hash = HashStringWithString(id, config.get('bot.secret'));
                var res = await GetDonations(hash, 1, 99)
                if (!res) {
                    return ctx.reply("😿 Произошла ошибка при получении донации. Попробуйте еще раз.");
                }
                if (res.status == 200) {
                    // todo: parse donations
                    if (res.data?.results?.length == 0) {
                        return ctx.reply('👀 Здесь пока что пусто...');
                    }
                    return ctx.reply(`Ваши донации:\n${JSON.stringify(res.data.results)}`);
                }
                return ctx.reply("😢 Произошла ошибка при получении донации. Попробуйте еще раз.");
            case buttonTexts.backToMenu: return ctx.scene.enter('menuScene');
            default: return ctx.reply('Воспользуйтесь одной из кнопок 👇');
        }
    });
}

export default InitScenes;