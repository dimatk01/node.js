class AbstractProduct {
    constructor(ID, name, description, price, brand,
        quantity, images) {
        this.ID = ID;
        this.name = name;
        this.description = description
        this.price = price;
        this.brand = brand;
        this.quantity = quantity
        this.date = new Date()
        this.reviews = [];
        this.images = images;
    }
    getID = () => this.ID
    setID = newID => this.ID = newID
    getName = () => this.name;
    setName = (newName) => this.name = newName;
    getDescription = () => this.description;
    setDescription = (newDescription) => this.description = newDescription;
    getPrise = () => this.price;
    setPrise = (newPrise) => this.price = newPrise;
    getBrand = () => this.brand;
    setBrand = (newBrand) => this.brand = newBrand;
    getQuantity = () => this.quantity;
    setQuantity = (newQuantity) => this.quantity = newQuantity;
    getDate = () => this.date
    setDate = (newDate) => this.Date = newDate;

    getterOrSetters(command, val) {
        //getters
        if (val === undefined) return Object.getOwnPropertyDescriptor(this, command).value
        // else setters
        else {
            Object.defineProperty(this, command, { value: val });
        }
    }
    getReviewByID = function (id) {
        for (const review of reviews) {
            if (review.id == id) {
                return review
            }
        }
    }
    getImage = function (index) {
        if (index == undefined)
            return images[0];
        return images[index]
    }
    addReview = function (id, author, comment, rating) {
        let review = new createReview(id, author, comment, rating)
        reviews.push(review);
    }
    createReview(id, author, comment, rating) {
        this.id = id;
        this.author = author;
        this.date = new Date();
        this.comment = comment;
        this.rating = rating;
    }
    deleteReview = function (id) {
        for (const review of reviews) {
            if (review.id == id) {
                reviews.splice(reviews.indexOf(review), 1)
                break;
            }
        }
    }
    getAverageRating = function () {
        let averageRating = 0;
        for (const review of reviews) {
            averageRating += review.rating++;
        }
        return averageRating / reviews.length
    }
    getFullInformation() {
        let information = `
            ID: ${this.ID}\n
            name: ${this.name}\n
            description: ${this.description}\n
            price: ${this.price}\n
            brand: ${this.brand}\n
            quantity: ${this.quantity}\n
            images: ${this.images}\n
            `
        return information
    }
    getPriceForQuantity(count) {
        return this.price * count;
    }


}
class Clothes extends AbstractProduct {
    constructor(ID, name, description, price, brand,
        quantity, images, material, color) {
        super(ID, name, description, price, brand,
            quantity, images)
        this.material = material;
        this.color = color;
    }
    getMaterial() {
        return this.material;
    }
    setMaterial(newMaterial) {
        return this.material = newMaterial;
    }
    getColor() {
        return this.color;
    } setColor(newColor) {
        return this.color = newColor;
    }
    searchProducts(products, search) {
        let results = [];
        for (const product of products) {
            if (product.getDescription().indexOf(search) != -1) results.push(product)
            else if (product.getName().indexOf(search) != -1) results.push(product)
        }
        return results
    }
    sortProducts(products, sortAttribute) {
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
}
class Electronics extends AbstractProduct {
    constructor(ID, name, description, price, brand,
        quantity, images, warranty, power) {
        super(ID, name, description, price, brand,
            quantity, images)
        this.warranty = warranty;
        this.power = power;
    }
    getWarranty() {
        return this.warranty;
    } setWarranty(newWarranty) {
        return this.warranty = newWarranty;
    }
    getPower() {
        return this.power
    } setPower(newPower) {
        return this.power = newPower;
    }
}