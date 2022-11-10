async function second():Promise<void> {
    await first(ip => console.log(ip))

}
function first(callBack: (ip: string) => void) {
    fetch('https://api.ipify.org/?format=json')
        .then(response => response.json())
        .then(data => callBack(data.ip))
}
second()