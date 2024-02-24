import { NetworkService } from "./NetworkService"

export const DonationService = {
    /**
     * Retrieves donations from the server using authentication.
     *
     * @param {function} success - callback function for successful response
     * @param {function} fail - callback function for failed response
     * @param {object} cookies - cookies for authentication
     * @return {undefined}
     */
    getDonations(success, fail, cookies) {
        NetworkService.AuthRequest("GET", `donations/`, {}, cookies, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}