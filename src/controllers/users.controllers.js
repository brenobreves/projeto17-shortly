import bcrypt from 'bcrypt';
import { v4 as uuid } from "uuid";
import {db} from "../database/database.connection.js"

export async function signUp(req,res){
    res.send("SignUp")
}

export async function signIn(req,res){
    res.send("SignIn")
}

export async function getMe(req,res){
    res.send("GetMe")
}