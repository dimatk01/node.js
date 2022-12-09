import path from "path";
class fileControllers {
    async save(files:any ) {
        return new Promise<boolean>((resolve, reject) => {
            if (files) {
                let sampleFile = files.book_img;
                let uploadPath = path.resolve(__dirname, "../views/images/", `${sampleFile.name}`)
                sampleFile.mv(uploadPath, <T> (err: string,results:Array<T>)=> {   
                    err ? reject(err) :resolve(true);
                });   
            }
        })
    }

}
module.exports = new fileControllers()