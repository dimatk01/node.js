async function firs(): Promise<string> {
    return await fetch('https://api.ipify.org/?format=json')
        .then(response => response.json())
        .then(data => (data.ip))
}
async function secon(callBack: (ip: string) => void) {
    await callBack(await firs())
}
secon(ip => console.log(ip))