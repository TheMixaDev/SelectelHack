import { NetworkService } from "./NetworkService"

export const BonusService = {
    getBonuses(success, fail) {
        NetworkService.ClassicRequest("GET", `bonuses/`, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    getBonus(id, success, fail) {
        NetworkService.ClassicRequest("GET", `bonuses/${id}/`, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
}