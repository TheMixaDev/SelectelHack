import { NetworkService } from "./NetworkService"

export const DonationService = {
    getDonations(success, fail, cookies) {
        NetworkService.AuthRequest("GET", `donations/`, {}, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}