
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
function outputHttpResponse(statusCode, statusMessage, headers, body) {
    const len = body + '';
    console.log(
        `HTTP/1.1 ${statusCode} ${statusMessage}
Server: Apache/2.2.14 (Win32)
Content-Length: ${len.length}
Connection: Closed
Content-Type: text/html; charset=utf-8

${body}
        `);
}

function processHttpRequest($method, $uri, $headers, $body) {
    let statusCode;
    let statusMessage;
    if ($method === "POST") {
        const regExpUri = /\/api\/checkLoginAndPassword/gm;
        const regExpContent = /application\/x-www-form-urlencoded/gm;
        statusCode = 0
        if (regExpUri.test($uri)) {
            if (regExpContent.test($headers['Content-Type'])) {
                let loginByBody = $body.replace(/login=|password=/gm, "").replace("&", ":")
                let data = require("fs").readFileSync("passwords.txt", "utf8").split("\r\n")
                for (let i = 0; i < data.length; i++) {
                    if (loginByBody == data[i]) {
                        statusCode = 200;
                        statusMessage = 'OK'
                        $body = `<h1 style="color:green">FOUND</h1>`;
                        break;
                    }
                }
                statusCode = 500;
                statusMessage = 'Internal Server Error'
                $body = "Internal Server Error"
            } else {
                statusCode = 404;
                statusMessage = 'Not found'
                $body = "Not found"
            }
        } else {
            statusCode = 404;
            statusMessage = 'Not found'
            $body = "Not found"
        }
    }

    outputHttpResponse(statusCode, statusMessage, $headers, $body);
}

function parseTcpStringAsHttpRequest($string) {
    let arrRows = $string.split("\n")
    let arrFirstRow = arrRows[0].split(' ')
    headersBuffer = {};
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
        body: arrRows[i + 1],
    };
}

http = parseTcpStringAsHttpRequest(contents);
processHttpRequest(http.method, http.uri, http.headers, http.body);
