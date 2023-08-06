import {db} from "../database/database.connection.js"

export async function validateAuth(req,res,next){
    const {authorization} = req.headers
    const token = authorization?.replace("Bearer ","")
    if(!token) return res.status(401).send("Requisição sem token de validação")
    try {
        const sessaoQuery = await db.query(`SELECT * FROM sessions WHERE token=$1`,[token])
        if(sessaoQuery.rowCount === 0) return res.status(401).send("Token inválido ou inativo")
        res.locals.sessao = sessaoQuery.rows[0];
        next()
    } catch (err) {
        res.status(500).send(err.message)
    }
}