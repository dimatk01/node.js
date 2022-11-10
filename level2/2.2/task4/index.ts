let countOfSteps: number = 1;
let countSteps: number = 1;
function withoutAsyncAwait(uri: string) {
    fetch(uri)
        .then(res => res.json())
        .then(user => {
            if (user.gender === "Female") {
                console.log((`Get user-women on ${countOfSteps} step(s),
                     name: ${user.first_name}, surname: ${user.last_name}`));
            } else {
                countOfSteps++;
                withoutAsyncAwait('https://random-data-api.com/api/users/random_user')
            }

        }).catch(e => console.log(e))

}

withoutAsyncAwait('https://random-data-api.com/api/users/random_user')

async function withAsyncAwait(uri: string) {
    const response = await fetch(uri);
    const data = await response.json();
    if (data.gender === "Female") {
        console.log((`Get user-women on ${countSteps} step(s),
             name: ${data.first_name}, surname: ${data.last_name}`));
    } else {
        countSteps++;
        withAsyncAwait('https://random-data-api.com/api/users/random_user')
    }
}
withAsyncAwait('https://random-data-api.com/api/users/random_user')