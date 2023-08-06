import {db} from "../database/database.connection.js"

export async function getRanking(req,res){
    try {
        const ranking = await db.query(`
        SELECT owner AS id, u.name, COUNT(*) as "linksCount", SUM("visitCount") as "visitCount"  
        FROM urls LEFT JOIN users u ON owner=u.id 
        GROUP BY owner, u.name 
        ORDER BY "visitCount" DESC 
        LIMIT 10;`)
        res.send(ranking.rows)
    } catch (err) {
        res.status(500).send(err.message)         
    }
}