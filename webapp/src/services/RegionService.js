import { NetworkService } from "./NetworkService"

export const RegionService = {
    getCities(success, fail) {
        NetworkService.ClassicRequest("GET", "cities/?page_size=999&with_bs=true", {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
}