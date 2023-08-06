import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { getMe, signIn, signUp } from "../controllers/users.controllers.js";

const usersRouter = Router()

usersRouter.post("/signup", signUp)
usersRouter.post("/signin", signIn)
usersRouter.get("/users/me", getMe)

export default usersRouter