import {db} from "../database/database.connection.js"

export async function postUrl(req,res){
    res.send("PostUrl")
}

export async function getUrlById(req,res){
    res.send("GetUrlById")
}

export async function openUrl(req,res){
    res.send("OpenUrl")
}

export async function deleteUrl(req,res){
    res.send("DeleteUrl")
}