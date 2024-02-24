import { NetworkService } from "./NetworkService"

export const EventService = {
    getEvents(success, fail) {
        NetworkService.ClassicRequest("GET", `events/?page_size=999&page=4`, {}, (response) => { // TODO remove hardcode
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}