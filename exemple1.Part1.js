function Product(ID, name, description, price, brand, sizes,
    activeSize, quantity, date, review, images) {
    let reviews = [review];
    this.ID = ID;
    this.name = name;
    this.description = description;
    this.price = price;
    this.brand = brand;
    this.sizes = sizes;
    this.activeSize = activeSize;
    this.quantity = quantity
    this.date = date;
    this.reviews = reviews;
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




}
let newPro = new Product("01", "nike01", 'somethin', 0, "nike", ['s', 'm'], "s", 10, new Date(),
    ["1", "Ted", new Date(), "nice", { servise: "5" }], ["img1"]);
console.log(newPro.getPrise())
console.log(newPro.setPrise(5))
console.log(newPro.getPrise())


