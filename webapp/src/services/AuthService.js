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
    /**
     * Registers an email with a password and a first name.
     *
     * @param {string} email - the email to register
     * @param {string} password - the password for the email
     * @param {string} first_name - the first name associated with the email
     * @param {function} success - the callback function to handle successful registration
     * @param {function} fail - the callback function to handle failed registration
     */
    registerEmail(email, password, first_name, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/registration/", { email, password, first_name }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Register a phone with the provided information.
     *
     * @param {type} phone - The phone number to be registered
     * @param {type} password - The password for the phone registration
     * @param {type} first_name - The first name associated with the phone number
     * @param {type} success - The success callback function
     * @param {type} fail - The fail callback function
     * @return {type}
     */
    registerPhone(phone, password, first_name, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/registration/", { phone, password, first_name }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Resends email code for the given user ID.
     *
     * @param {number} user_id - The ID of the user
     * @param {function} success - The success callback function
     * @param {function} fail - The fail callback function
     * @return {void} 
     */
    resendEmail(user_id, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/resend_email_code/", { user_id }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Resend a phone code for the user.
     *
     * @param {type} user_id - The ID of the user
     * @param {type} success - The success callback function
     * @param {type} fail - The fail callback function
     * @return {type} No return value
     */
    resendPhone(user_id, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/resend_code/", { user_id }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Confirm user's email registration with the provided code and user ID.
     *
     * @param {type} code - the confirmation code
     * @param {type} user_id - the user's ID
     * @param {type} email - the user's email
     * @param {type} success - callback function to handle successful confirmation
     * @param {type} fail - callback function to handle failed confirmation
     */
    confirmEmail(code, user_id, email, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/confirm_email_reg/", { code, user_id, email }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * confirmPhone - A function to confirm the user's phone using the provided code.
     *
     * @param {type} code - The confirmation code
     * @param {type} user_id - The user's ID
     * @param {type} phone - The user's phone number
     * @param {type} success - The callback function to be executed on success
     * @param {type} fail - The callback function to be executed on failure
     */
    confirmPhone(code, user_id, phone, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/confirm_phone_reg/", { code, user_id, phone }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}