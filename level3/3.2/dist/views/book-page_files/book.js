document.querySelector('.btnBookID').addEventListener('click', () => {
    var httpRequest = false;

    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        httpRequest = new XMLHttpRequest();
        if (httpRequest.overrideMimeType) {
            httpRequest.overrideMimeType('text/xml');
        }
    } else if (window.ActiveXObject) { // IE
        try {
            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) { }
        }
    }

    if (!httpRequest) {
        alert('Не вышло :( Невозможно создать экземпляр класса XMLHTTP ');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
                alert(
                    "Книга свободна и ты можешь прийти за ней." +
                    " Наш адрес: г. Кропивницкий, переулок Васильевский 10, 5 этаж." +
                    " Лучше предварительно прозвонить и предупредить нас, чтоб " +
                    " не попасть в неловкую ситуацию. Тел. 099 196 24 69")
            } else {
                alert('С запросом возникла проблема.');
            }
        }
    };
    httpRequest.open('POST', '', true);
    httpRequest.send();

}

)

