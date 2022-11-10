"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
const apiURL = "https://random-data-api.com/api/name/random_name";
function getName(url) {
    return __awaiter(this, void 0, void 0, function* () {
        const res = yield fetch(url);
        const jsonFile = yield res.json();
        return jsonFile.name;
    });
}
function threeNames(apiURL) {
    return __awaiter(this, void 0, void 0, function* () {
        return yield Promise.all([
            getName(apiURL),
            getName(apiURL),
            getName(apiURL)
        ]);
    });
}
threeNames(apiURL).then(names => console.log(names));
