import { NetworkService } from "./NetworkService"

export const RegionService = {
    /**
     * Retrieves a list of cities.
     *
     * @param {function} success - Callback function to handle successful response
     * @param {function} fail - Callback function to handle failed response
     * @return {void}
     */
    getCities(success, fail) {
        NetworkService.ClassicRequest("GET", "cities/?page_size=999&with_bs=true", {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
}