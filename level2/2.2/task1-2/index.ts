const url: string = 'https://api.ipify.org/?format=json';
async function toDoRequest(url: string) {
  const response = await fetch(url);
  return await response.json();
}
console.log(
  toDoRequest(url))