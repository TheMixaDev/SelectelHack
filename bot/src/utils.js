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

function PrettyBloodGroup(bloodGroup) {
    switch (bloodGroup) {
        case "o_plus": return "O(I) Rh+";
        case "o_minus": return "O(I) Rh-";
        case "a_plus": return "A(II) Rh+";
        case "a_minus": return "A(II) Rh-";
        case "b_plus": return "B(III) Rh+";
        case "b_minus": return "B(III) Rh-";
        case "ab_plus": return "AB(IV) Rh+";
        case "ab_minus": return "AB(IV) Rh-";
        default: return "Не знаю";

    }
}
export { GenerateLink, ImageUrlToByteArray, PrettyBloodGroup };