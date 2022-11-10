const apiURL:string = "https://random-data-api.com/api/name/random_name"
async function getName(url:string):Promise<string> {
    const res =await fetch(url);
    const jsonFile = await res.json();
    return jsonFile.name
}
 async function threeNames (apiURL:string): Promise<string[]>{
return await Promise.all([
    getName(apiURL),
    getName(apiURL),
    getName(apiURL)
])
}
threeNames(apiURL).then(names=>console.log(names));

