import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postUrl, getUrlById, openUrl, deleteUrl } from "../controllers/urls.controllers.js";

const urlRouter = Router()

urlRouter.post("/urls/shorten",postUrl)
urlRouter.get("/urls/:id",getUrlById)
urlRouter.get("/urls/open/:shortUrl",openUrl)
urlRouter.delete("/urls/:id",deleteUrl)

export default urlRouter
