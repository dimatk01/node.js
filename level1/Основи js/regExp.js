let Validator = {
    validateEmail: function (email) {
        const regex = /^\w[^@_]{1,20}@[^@]{1,15}\.\w{1,5}/g;
        return regex.test(email);
    },
    validatePhone: function (phone) {
        const regex = /(\+38[ \-]?|[ \-]{0,5})?\(?(\d[ \-\)]{0,2}){3}(\d[ \-]?){7}/g;
        return regex.test(phone);
    },
    validatePassword: function (password) {
        const regex = /(?=\w*[a-z])(?=\w*[A-Z])(?=\w*\d)\w{8,20}/g;
        return regex.test(password);
    }
}