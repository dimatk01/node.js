export type Item = {
    id: number
    text: string
    checked: boolean
}
export type User ={
    login:string
    pass: string
    items?:[]
    lastItemsId?:number
}