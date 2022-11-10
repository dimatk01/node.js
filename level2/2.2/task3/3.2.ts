async function getNames(url:string):Promise<string[]> {
    let names:string[]=[];
    for (let i = 0; i <3; i++){
    const res =await fetch(url);
    const data = await res.json()
    names.push(data.name)}
    return names;
}
  getNames("https://random-data-api.com/api/name/random_name").then(names=>console.log(names));
