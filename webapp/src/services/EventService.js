import { NetworkService } from "./NetworkService"

export const EventService = {
    /**
     * Retrieves events from the network service using a classic request.
     *
     * @param {function} success - the success callback function
     * @param {function} fail - the failure callback function
     * @return {void} 
     */
    getEvents(success, fail) {
        NetworkService.ClassicRequest("GET", `events/?page_size=999&page=4`, {}, (response) => { // TODO remove hardcode
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}