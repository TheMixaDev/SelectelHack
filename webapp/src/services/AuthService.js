import { NetworkService } from "./NetworkService"

export const AuthService = {
    /**
     * Logs in the user with the provided credentials.
     *
     * @param {boolean} isEmail - Specifies whether the username is an email address.
     * @param {string} username - The username or email address of the user.
     * @param {string} password - The password of the user.
     * @param {function} success - The callback function to be called on successful login.
     * @param {function} fail - The callback function to be called on failed login.
     */
    login(username, password, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/login/", { username, password }, (response) => {
            if(response.data)
                success(response);
            else fail();
        }, fail)
    },
    registerEmail(email, password, first_name, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/registration/", { email, password, first_name }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    registerPhone(phone, password, first_name, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/registration/", { phone, password, first_name }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    resendEmail(user_id, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/resend_email_code/", { user_id }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    resendPhone(user_id, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/resend_code/", { user_id }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    confirmEmail(code, user_id, email, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/confirm_email_reg/", { code, user_id, email }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    confirmPhone(code, user_id, phone, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/confirm_phone_reg/", { code, user_id, phone }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
}