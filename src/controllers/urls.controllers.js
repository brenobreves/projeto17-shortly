import {db} from "../database/database.connection.js"
import { nanoid } from "nanoid"

export async function postUrl(req,res){
    const {url} = req.body
    const userId = res.locals.sessao.userId
    const shortUrl = nanoid(8)
    try {
        const insertUrl = await db.query(`INSERT INTO urls (url,owner,"shortUrl") VALUES ($1,$2,$3);`,[url,Number(userId),shortUrl])
        const urlQuery = await db.query(`SELECT * FROM urls WHERE "shortUrl"=$1;`,[shortUrl])
        const resObj = urlQuery.rows[0]
        delete resObj.url
        delete resObj.owner
        delete resObj.visitCount
        delete resObj.createdAt
        res.status(201).send(resObj)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getUrlById(req,res){
    const {id} = req.params
    try {
        const urlQuery = await db.query(`SELECT id,"shortUrl",url FROM urls WHERE id=$1;`,[Number(id)])
        if(urlQuery.rowCount === 0 ) return res.sendStatus(404)
        const resObj = urlQuery.rows[0]
        res.send(resObj)
    } catch (err) {
        res.status(500).send(err.message)        
    }
}

export async function openUrl(req,res){
    const {shortUrl} = req.params
    try {
        const urlQuery = await db.query(`SELECT * FROM urls WHERE "shortUrl"=$1;`,[shortUrl])
        if(urlQuery.rowCount === 0) return res.sendStatus(404)
        const updateVisit = await db.query(`UPDATE urls SET "visitCount"="visitCount"+1 WHERE id=$1`,[urlQuery.rows[0].id])
        res.redirect(urlQuery.rows[0].url)
    } catch (err) {
        res.status(500).send(err.message)            
    }
}

export async function deleteUrl(req,res){
    const urlId = req.params.id
    const reqId = res.locals.sessao.userId
    try {
        const urlQuery = await db.query(`SELECT * FROM urls WHERE id=$1;`,[Number(urlId)])
        if(urlQuery.rowCount === 0) return res.sendStatus(404)
        if(urlQuery.rows[0].owner !== reqId) return res.sendStatus(401)
        const deleteUrl = await db.query(`DELETE FROM urls WHERE id=$1;`,[urlId])
        res.sendStatus(204)
    } catch (err) {
        res.status(500).send(err.message)        
    }
}