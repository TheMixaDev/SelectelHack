import { NetworkService } from "./NetworkService"

export const BonusService = {
    getBonuses(success, fail) {
        NetworkService.ClassicRequest("GET", `bonuses/`, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    getNeeds(city_id, blood_group, success, fail) {
        let request = `needs/?city_id=${city_id}&page_size=999`;
        if(blood_group*1) request += `&blood_group=${blood_group}`;
        NetworkService.ClassicRequest("GET", request, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    }
}