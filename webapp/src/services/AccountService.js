import { NetworkService } from "./NetworkService"

export const AccountService = {
    /**
     * Performs a GET request to fetch user information.
     *
     * @param {function} success - callback function to handle successful response
     * @param {function} fail - callback function to handle failed response
     * @param {Object} cookies - cookies to be sent with the request
     * @return {void} 
     */
    getMe(success, fail, cookies) {
        NetworkService.AuthRequest("GET", "auth/me/", {}, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Performs a patch request to update user information.
     *
     * @param {type} data - The data to be sent in the request
     * @param {type} success - The callback function to handle successful response
     * @param {type} fail - The callback function to handle failed response
     * @param {type} cookies - The cookies to be included in the request
     * @return {type} undefined
     */
    patchMe(data, success, fail, cookies) {
        NetworkService.AuthRequest("PATCH", "auth/me/", data, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Sends a request to get the top donors.
     *
     * @param {function} success - callback function to handle successful response
     * @param {function} fail - callback function to handle failed response
     * @return {void} 
     */
    getTopDonors(success, fail) {
        NetworkService.ClassicRequest("GET", "users_top/", {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Recover the user account using the provided username.
     *
     * @param {string} username - The username of the account to recover
     * @param {function} success - The callback function to handle a successful recovery
     * @param {function} fail - The callback function to handle a failed recovery
     * @return {void} 
     */
    recover(username, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/recover/", { username }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Update the password using the NetworkService.AuthRequest method.
     *
     * @param {type} password - description of the password parameter
     * @param {type} success - description of the success callback
     * @param {type} fail - description of the fail callback
     * @param {type} cookies - description of the cookies parameter
     * @return {type} description of the return value
     */
    updatePassword(password, success, fail, cookies) {
        NetworkService.AuthRequest("PATCH", "auth/password/", { password }, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}