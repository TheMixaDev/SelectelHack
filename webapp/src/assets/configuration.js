export const configuration = {
    serverUrl: import.meta.env.MODE === 'development' ? `http://localhost:3033/api/` : `/api/`,
}