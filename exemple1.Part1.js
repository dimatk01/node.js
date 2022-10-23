function Product(ID, name, description, price, brand, sizes,
    activeSize, quantity, date, images) {
    let reviews = [];
    if (typeof (ID) == "string")
        this.ID = ID;
    else throw new Error("please, check enter");
    if (typeof (name) == "string")
        this.name = name;
    else throw new Error("please, check enter");
    if (typeof (description) == "string")
        this.description = description;
    else throw new Error("please, check enter");
    if (typeof (price) == "number")
        this.price = price;
    else throw new Error("please, check enter");
    if (typeof (brand) == "string")
        this.brand = brand;
    else throw new Error("please, check enter");
    if (typeof (sizes[0]) == "string")
        this.sizes = sizes;
    else throw new Error("please, check enter");
    if (typeof (activeSize) == "string")
        this.activeSize = activeSize;
    else throw new Error("please, check enter");
    if (typeof (quantity) == "number")
        this.quantity = quantity
    else throw new Error("please, check enter");
    this.date = date;
    this.images = images;

    this.getID = function () {
        return this.ID
    }
    this.setID = function (newID) {
        return this.ID = newID
    }
    this.getName = function () {
        return this.name;
    }
    this.setName = function (newName) {
        return this.name = newName;
    }
    this.getDescription = function () {
        return this.description;
    }
    this.setDescription = function (newDescription) {
        return this.description = newDescription;
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
        return this.brand = newBrand;
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
        return this.quantity = newQuantity;
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


let p1 = new Product("01", "nike01", "футболка для занять спортом",30, "nike", ['s', 'm'], "s", 10, new Date(), ["img1", "img2"]);
let P2 = new Product("02", "adidas", "футбольні кросівки", 20, "nike", ['39', '40'], "40", 10, new Date(), ["img1", "img2"]);
let products = [p1, P2]
console.log(searchProducts(products, "футб"))
console.log(sortProducts(products,"-name"))
function searchProducts(products, search) {
    let results = [];
    for (const product of products) {
        if (product.getDescription().indexOf(search) != -1) results.push(product)
    }
    return results
}
function sortProducts(products, sortAttribute){
    let results = [];
    switch (sortAttribute){
        case"price": {
            for (const product of products) {
                results.push(product.getPrise())
            }
            return results.sort()
        }
        case"-price": {
            for (const product of products) {
                results.push(product.getPrise())
            }
            return results.sort().reverse()
        }
        case"ID": {
            for (const product of products) {
                results.push(product.getID())
            }
            return results.sort()
        }
        case"-ID": {
            for (const product of products) {
                results.push(product.getID())
            }
            return results.sort().reverse()
        }
        case"name": {
            for (const product of products) {
                results.push(product.getName())
            }
            return results.sort()
        }case"-name": {
            for (const product of products) {
                results.push(product.getName())
            }
            return results.sort().reverse()
        }
    }
}
