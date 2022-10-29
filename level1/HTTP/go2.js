function readHttpLikeInput() {
    var fs = require("fs");
    var res = "";
    var buffer = Buffer.alloc ? Buffer.alloc(1) : new Buffer(1);
    let was10 = 0;
    for (; ;) {
        try { fs.readSync(0 /*stdin fd*/, buffer, 0, 1); } catch (e) { break; /* windows */ }
        if (buffer[0] === 10 || buffer[0] === 13) {
            if (was10 > 10)
                break;
            was10++;
        } else
            was10 = 0;
        res += new String(buffer);
    }

    return res;
}

let contents = readHttpLikeInput();

// вот эту функцию собственно надо написать
function parseTcpStringAsHttpRequest(string) {
    let arrRows = string.split("\n")
    let arrFirstRow = arrRows[0].split(' ')
    headersBuffer ={};
    let i = 1;
    for (; i < arrRows.length; i++) {
        if (arrRows[i] == "") break;
        let buffer = arrRows[i].split(": ")
        headersBuffer[buffer[0]] = buffer[1]
    }
    return {
        method: arrFirstRow[0],
        uri: arrFirstRow[1],
        headers: headersBuffer,
        body: arrRows[i+1],
    };
}

http = parseTcpStringAsHttpRequest(contents);
console.log(JSON.stringify(http, undefined, 2));