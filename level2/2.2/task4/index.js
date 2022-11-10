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
let countOfSteps = 1;
let countSteps = 1;
function withoutAsyncAwait(uri) {
    fetch(uri)
        .then(res => res.json())
        .then(user => {
        if (user.gender === "Female") {
            console.log((`Get user-women on ${countOfSteps} step(s),
                     name: ${user.first_name}, surname: ${user.last_name}`));
        }
        else {
            countOfSteps++;
            withoutAsyncAwait('https://random-data-api.com/api/users/random_user');
        }
    }).catch(e => console.log(e));
}
withoutAsyncAwait('https://random-data-api.com/api/users/random_user');
function withAsyncAwait(uri) {
    return __awaiter(this, void 0, void 0, function* () {
        const response = yield fetch(uri);
        const data = yield response.json();
        if (data.gender === "Female") {
            console.log((`Get user-women on ${countSteps} step(s),
             name: ${data.first_name}, surname: ${data.last_name}`));
        }
        else {
            countSteps++;
            withAsyncAwait('https://random-data-api.com/api/users/random_user');
        }
    });
}
withAsyncAwait('https://random-data-api.com/api/users/random_user');
