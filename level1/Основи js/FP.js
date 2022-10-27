let CVSText = `46.49,36.58,Бердянськ,121692,
49.15,28.41,Вінниця,356665,
44.38,34.33,Алушта,31440,
49.46,30.17,Біла Церква,200131,
49.54,28.49,Бердичів,87575,#некоммент

#

#45.40,34.29,Джанкой,43343,

# в этом файле три строки-коммента :)`



function parseCVS(cvs) {
    let arr = {};
    let parsedText = cvs.split("\n")
        .filter(item => item[0] != "#" && item[0] != undefined)
        .map(item => {
            item = item.split(',');
            return {
                "x": item[0],
                "y": item[1],
                "name": item[2],
                "population": item[3]++
            }
        }).sort((a, b) => b["population"] - a["population"])
        .slice(0, 10)
        .reduce((previousValue, currentValue, index) => {
            previousValue[currentValue.name] = { "population": currentValue.population, "rating": index + 1 }
            return previousValue;
        }, arr)

    return (enterText) => {
        let regExp = new RegExp(Object.keys(parsedText).join("|"), "i")
        return enterText.replace(regExp, newString => newString + " ( " +
            parsedText[newString].rating + " место в ТОП-10 самых крупных городов Украины,  население "
            + parsedText[newString].population + " человек )")
    }



}

let parser = parseCVS(CVSText);
console.log(parser("Вінниця файне місто"))