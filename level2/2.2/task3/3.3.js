"use strict";
function withPromise(uri) {
    return new Promise((resolve, reject) => {
        fetch(uri)
            .then(res => res.json())
            .then(res => console.log(res.name));
    });
}
const firsResponse = withPromise("https://random-data-api.com/api/name/random_name");
const secondResponse = withPromise("https://random-data-api.com/api/name/random_name");
const thirdResponse = withPromise("https://random-data-api.com/api/name/random_name");
