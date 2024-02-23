import { ref } from 'vue'
import { defineStore } from 'pinia'
import { AuthService } from '@/services/AuthService'

export const useAuthStore = defineStore('user', () => {
    const token = ref(null);
    const user = ref(null);

    /**
     * Logs in a user using the provided credentials.
     *
     * @param {Object} cookies - The cookies object used to set the session and user cookies.
     * @param {boolean} isEmail - A flag indicating whether the username is an email or not.
     * @param {string} username - The username or email of the user.
     * @param {string} password - The password of the user.
     * @param {boolean} rememberMe - A flag indicating whether to remember the user or not.
     * @param {function} success - The callback function to be executed on successful login.
     * @param {function} fail - The callback function to be executed on login failure.
     */
    function login(cookies, isEmail, username, password, rememberMe, success, fail) {
        AuthService.login(isEmail, username, password, data => {
            token.value = data;
            user.value = username;
            cookies.set("solarToken", data, rememberMe ? "30d" : "session");
            cookies.set("user", username, rememberMe ? "30d" : "session");
            success();
        }, fail);
    }
    function register(username, email, password, success, fail) {
        AuthService.register(username, email, password, success, fail);
    }
    /**
     * Checks if the user is logged in using cookies.
     *
     * @param {Object} cookies - The cookies object containing the user's session information.
     * @param {function} success - The callback function to be executed if the user is successfully logged in.
     * @param {function} fail - The callback function to be executed if the user is not logged in.
     */
    function cookieLogin(cookies, success, fail) {
        if(token.value && user.value)
            return success();
        if(cookies.isKey("solarToken") && cookies.isKey("user")) {
            token.value = cookies.get("solarToken");
            user.value = cookies.get("user");
            return success();
        }
        logout(cookies);
        fail();
    }
    /**
     * Logout the user by removing the token and user value from the cookies.
     *
     * @param {Object} cookies - The cookies object.
     */
    function logout(cookies) {
        token.value = null;
        user.value = null;
        cookies.remove("solarToken");
        cookies.remove("user");
    }

    return {
        token,
        user,
        login,
        cookieLogin,
        logout,
        register
    }
})
