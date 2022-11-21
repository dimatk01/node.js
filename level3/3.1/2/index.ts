enum Button{
    add="add",
    remove ="remove"
}
async function changeAdd (){
    const response = await fetch("http://localhost:3000/", {
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
          'Content-Type': 'application/json'
          // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirect: 'follow', // manual, *follow, error
        referrerPolicy: 'no-referrer', // no-referrer, *client
        body: JSON.stringify({button:Button.add}) // body data type must match "Content-Type" header
      });
    const element = document.getElementById('countOfAdd')
     await response.json().then ((data)=>element!.innerHTML=`count add ${data.count}`)
}
 async function changeRemove(){
  const response = await fetch("http://localhost:3000/", {
    method: 'POST', // *GET, POST, PUT, DELETE, etc.
    mode: 'cors', // no-cors, *cors, same-origin
    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
    credentials: 'same-origin', // include, *same-origin, omit
    headers: {
      'Content-Type': 'application/json'
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
    redirect: 'follow', // manual, *follow, error
    referrerPolicy: 'no-referrer', // no-referrer, *client
    body: JSON.stringify({button:Button.remove}) // body data type must match "Content-Type" header
  });
const element = document.getElementById('countOfRemove')
 await response.json().then ((data)=>element!.innerHTML=`count remove ${data.count}`)
}
