import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postUrl, getUrlById, openUrl, deleteUrl } from "../controllers/urls.controllers.js";
import { postUrlSchema } from "../schemas/postUrl.schema.js";
import { validateAuth } from "../middlewares/validateAuth.middleware.js";

const urlRouter = Router()

urlRouter.post("/urls/shorten",validateSchema(postUrlSchema),validateAuth,postUrl)
urlRouter.get("/urls/:id",getUrlById)
urlRouter.get("/urls/open/:shortUrl",openUrl)
urlRouter.delete("/urls/:id",validateAuth,deleteUrl)

export default urlRouter
