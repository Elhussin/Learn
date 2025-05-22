const mongoose = require("mongoose")

const Schema = mongoose.Schema

const ArticalSchema = new Schema({
    title: {
        type: String,
        required: true
    },
    body: {
        type: String,
        required: true
    },
    date: {
        type: Date,
        default: Date.now
    }
})
const Artical = mongoose.model("Artical", ArticalSchema)

module.exports = Artical 