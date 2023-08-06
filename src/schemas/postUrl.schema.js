import Joi from "joi"

export const postUrlSchema = Joi.object({
    url: Joi.string().uri().required()
})