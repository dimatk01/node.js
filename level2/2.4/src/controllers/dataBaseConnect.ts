import { Collection, MongoClient } from "mongodb";
const uri='mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.6.0'

export  let  collection:Collection;
export async function dataBaseConnect() {
    const client =new MongoClient(uri)
   await client.connect()
   collection = await client.db("mongodb").collection("todos")
}