import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { getMe, signIn, signUp } from "../controllers/users.controllers.js";
import { signupSchema } from "../schemas/signup.schema.js";
import { signinSchema } from "../schemas/signin.schema.js";

const usersRouter = Router()

usersRouter.post("/signup",validateSchema(signupSchema), signUp)
usersRouter.post("/signin",validateSchema(signinSchema), signIn)
usersRouter.get("/users/me", getMe)

export default usersRouter