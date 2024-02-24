import { NetworkService } from "./NetworkService"

export const BonusService = {
    /**
     * Get bonuses from the server.
     *
     * @param {function} success - Callback function to handle successful response
     * @param {function} fail - Callback function to handle failed response
     * @return {void} 
     */
    getBonuses(success, fail) {
        NetworkService.ClassicRequest("GET", `bonuses/`, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Retrieves the bonus with the given ID.
     *
     * @param {type} id - ID
     * @param {type} success - success callback
     * @param {type} fail - fail callback
     */
    getBonus(id, success, fail) {
        NetworkService.ClassicRequest("GET", `bonuses/${id}/`, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
}