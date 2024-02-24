import { NetworkService } from "./NetworkService"

export const StationService = {
    /**
     * Retrieves the list of blood stations for a given city.
     *
     * @param {number} city_id - The ID of the city for which to retrieve blood stations
     * @param {function} success - The callback function to handle the successful response
     * @param {function} fail - The callback function to handle the failed response
     * @return {void} 
     */
    getStations(city_id, success, fail) {
        NetworkService.ClassicRequest("GET", `blood_stations/?city_id=${city_id}&page_size=999`, {}, (response) => {
            if(response.status === 200)
                success(response.data);
            else fail(response.data);
        }, fail)
    },
    /**
     * Retrieves the needs for a given city and blood group.
     *
     * @param {number} city_id - The ID of the city
     * @param {string} blood_group - The blood group
     * @param {function} success - The success callback function
     * @param {function} fail - The fail callback function
     * @return {void} 
     */
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