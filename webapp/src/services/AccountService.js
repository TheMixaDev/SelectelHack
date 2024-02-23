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
    patchCard(data, success, fail, cookies) {
        NetworkService.AuthRequest("PATCH", "auth/donor_card/", data, cookies, (response) => {
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
    }
}