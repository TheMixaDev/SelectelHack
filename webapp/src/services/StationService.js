import { NetworkService } from "./NetworkService"

export const StationService = {
    getStations(city_id, success, fail) {
        NetworkService.ClassicRequest("GET", `blood_stations/?city_id=${city_id}&page_size=999`, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
}