function Product(ID, name, description, price, brand, sizes,
    activeSize, quantity, date, images) {
    let reviews = [];
    this.ID = ID;
    this.name = name;
    this.description = description;
    this.price = price;
    this.brand = brand;
    this.sizes = sizes;
    this.activeSize = activeSize;
    this.quantity = quantity
    this.date = date;
    this.images = images;

    this.getID = function () {
        return this.ID
    }
    this.setID = function (newID) {
        if (typeof (newID) == "string")
            return this.ID = newID
        else throw new Error("please, check enter");
    }
    this.getName = function () {
        return this.name;
    }
    this.setName = function (newName) {
        if (typeof (newName) == "string")
            return this.name = newName;
        else throw new Error("please, check enter");
    }
    this.getDescription = function () {
        return this.description;
    }
    this.setDescription = function (newDescription) {
        if (typeof (newDescription) == "string")
            return this.description = newDescription;
        else throw new Error("please, check enter");
    }
    this.getPrise = function () {
        return this.price;
    }
    this.setPrise = function (newPrise) {
        if (typeof (newPrise) == 'number') {
            return this.price = newPrise;
        }
        else throw new Error("please, check enter");
    }
    this.getBrand = function () {
        return this.brand;
    }
    this.setBrand = function (newBrand) {
        if (typeof (newBrand) == "string")
            return this.brand = newBrand;
        else throw new Error("please, check enter");
    }
    this.getSizes = function () {
        return this.sizes
    }
    this.setSizes = function (newSizes) {
        return this.sizes = newSizes;
    }
    this.getActiveSize = function () {
        return this.activeSize
    }
    this.setActiveSize = function (newActiveSize) {
        return this.activeSize = newActiveSize;
    }
    this.getQuantity = function () {
        return this.quantity;
    }
    this.setQuantity = function (newQuantity) {
        if (typeof (newQuantity) == "number")
            return this.quantity = newQuantity;
        else throw new Error("please, check enter");
    }
    this.getDate = function () {
        return this.date
    }
    this.setDate = function (newDate) {
        return this.Date = newDate;
    }



    this.getReviewByID = function (id) {
        if (id < 0) throw new Error("Check id!")
        for (const review of reviews) {
            if (review.id == id) {
                return review
            }
        }
    }
    this.getImage = function (index) {
        if (index < 0 | index > images.length - 1) throw new Error("Check index!")
        if (index == undefined)
            return images[0];
        return images[index]
    }
    this.addSize = function (size) {
        if (sizes.includes(size)) throw new Error("This size already exists!")
        else sizes.push(size)
    }
    this.deleteSize = function (size) {
        if (!sizes.includes(size) && typeof (size) == 'string') throw new Error("This size does not exists!")
        else sizes.splice(sizes.indexOf(size), 1)
    }
    this.addReview = function (id, author, comment, rating) {
        let review = new createReview(id, author, comment, rating)
        reviews.push(review);
    }
    function createReview(id, author, comment, rating) {
        this.id = id;
        this.author = author;
        this.date = new Date();
        this.comment = comment;
        this.rating = rating;
    }
    this.deleteReview = function (id) {
        for (const review of reviews) {
            if (review.id == id) {
                reviews.splice(reviews.indexOf(review), 1)
                break;
            }
        }
    }
    this.getAverageRating = function () {
        let averageRating = 0;
        for (const review of reviews) {
            averageRating += review.rating++;
        }
        return averageRating / reviews.length
    }


}

function searchProducts(products, search) {
    let results = [];
    for (const product of products) {
        if (product.getDescription().indexOf(search) != -1) results.push(product)
        else if (product.getName().indexOf(search) != -1) results.push(product)
    }
    return results
}
function sortProducts(products, sortAttribute) {
    switch (sortAttribute) {
        case "price": {
            return products.sort((a, b) => a.getPrise() > b.getPrise() ? 1 : -1)
        }
        case "ID": {
            return products.sort((a, b) => a.getID() > b.getID() ? 1 : -1)
        }
        case "name": {
            return products.sort((a, b) => a.getName() > b.getName() ? 1 : -1)
        }
    }
}
