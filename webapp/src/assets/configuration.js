export const configuration = {
    serverUrl: import.meta.env.MODE === 'development' ? `https://hackaton.donorsearch.org/api/` : `/api/`,
}