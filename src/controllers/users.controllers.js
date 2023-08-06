import bcrypt from 'bcrypt';
import { v4 as uuid } from "uuid";
import {db} from "../database/database.connection.js"

export async function signUp(req,res){
    const {name, email, password, confirmPassword} = req.body
    if(password !== confirmPassword) return res.status(422).send("Confirmação de senha diferente")
    try {
        const validateMail = await db.query(`SELECT * FROM users WHERE email=$1;`,[email])
        if(validateMail.rowCount !== 0) return res.status(409).send("Email já cadastrado")
        const cryptPassword = bcrypt.hashSync(password, 10)
        const insertUser = await db.query(`INSERT INTO users (name,email,password) VALUES ($1,$2,$3);`,[name,email,cryptPassword])
        res.sendStatus(201)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function signIn(req,res){
    const {email,password} = req.body
    try {
        const userQuery = await db.query(`SELECT * FROM users WHERE email=$1;`,[email])
        if(userQuery.rowCount === 0) return res.status(401).send("Usuário não localizado")
        const user = userQuery.rows[0]
        if(!bcrypt.compareSync(password,user.password)) return res.status(401).send("Senha incorreta")
        const token = uuid()
        const insertSession = await db.query(`INSERT INTO sessions (token,"userId") VALUES ($1,$2);`,[token,user.id])
        const resObj = {token}
        res.send(resObj)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getMe(req,res){
    const userId = res.locals.sessao.userId
    try {
        const user = (await db.query(`SELECT * FROM users WHERE id=$1;`,[userId])).rows[0]
        const userUrls = await db.query(`SELECT id, "shortUrl", url, "visitCount" FROM urls WHERE owner=$1;`,[userId])
        let visitCount = 0
        for(let i = 0 ; i < userUrls.rowCount ; i++){
            visitCount+= userUrls.rows[i].visitCount
        }
        const resObj = {
            id:userId,
            name: user.name,
            visitCount,
            shortenedUrls: userUrls.rows
        }
        res.send(resObj)
    } catch (err) {
        res.status(500).send(err.message)       
    }
}