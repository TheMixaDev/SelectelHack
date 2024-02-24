import { NetworkService } from "./NetworkService"

export const AccountService = {
    getMe(success, fail, cookies) {
        NetworkService.AuthRequest("GET", "auth/me/", {}, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    patchMe(data, success, fail, cookies) {
        NetworkService.AuthRequest("PATCH", "auth/me/", data, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    getTopDonors(success, fail) {
        NetworkService.ClassicRequest("GET", "users_top/", {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    recover(username, success, fail) {
        NetworkService.ClassicRequest("POST", "auth/recover/", { username }, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    updatePassword(password, success, fail, cookies) {
        NetworkService.AuthRequest("PATCH", "auth/password/", { password }, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}