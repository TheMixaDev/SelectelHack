/**
 * Generate a link with the given parameters.
 * @param {string} addr - The address of the website.
 * @param {string} path - The path of the page.
 * @param {string} hash - The hash of the page. (optional)
 * @param {string} id - The id of the link. (optional)
 * @param {string} token - The token of the link. (optional)
 * @returns {string} The generated link.
 */
function GenerateLink(addr, path, hash, id, token) {
    let res = `${addr}?path=${path}`;
    if (hash != '') {
        res += `&hash=${hash}`;
    }
    if (id != '') {
        res += `&id=${id}`;
    }
    if (token != '') {
        res += `&token=${token}`;
    }
    res += `&time=${new Date().getTime()}`;
    return res;
}

async function ImageUrlToByteArray(imageUrl) {
    try {
        // Fetch the image as a binary Blob
        const response = await fetch(imageUrl);
        const blob = await response.blob();

        // Convert Blob to Uint8Array
        const arrayBuffer = await blob.arrayBuffer();
        const byteArray = new Uint8Array(arrayBuffer);

        return byteArray;
    } catch (error) {
        console.error('Error converting image URL to byte array:', error);
        return null;
    }
}
export { GenerateLink, ImageUrlToByteArray };