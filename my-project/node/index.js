const express= require("express")
// import express from "express" ;

//  import mongoose from "mongoose" ;
const mongoose = require("mongoose")

// import Artical from "./modles/Artical.js" ;
const Artical = require("./modles/Artical") ;

const app= express()
app.use(express.json()) // llow app to expet json 
app.get("/hello" ,(req,res)=>{
    // can write javScript code
    res.send("hello")
})
app.get("/me" ,(req,res)=>{
    res.send("First Page")
})

app.post("/test" ,(req,res)=>{
    res.send("test Page")
})
app.delete("/delate" ,(req,res)=>{
    res.send("test Page")
})

// try pat parmter
app.get("/try-prm/:num1/:num2",(req,res)=>{
    console.log(req.params)
    res.send("Try Prm")
})

// /try  body parmter & query parmter 
app.get("/try-body-prm",(req,res)=>{
    console.log(req.body)
    console.log(req.query)
    res.send("expet body")
})

// send json
app.get("/send-json",(req,res)=>{
    let dat ={name:"hussan", age:10}
    res.json(dat)
})

// send html
app.get("/send-html",(req,res)=>{
    let view =`<h1>Hell hussain<h1>`
    res.send(view)
})


// send file 
app.get("/send-file",(req,res)=>{
    // let view =`<h1>Hell hussain<h1>`
    // res.send(view)
    const path =__dirname +"/views/index.html"
    res.sendFile(path)

}) 

// use ejs templeat
app.get("/use-ejs",(req,res)=>{

    let data ={name:"hussan", age:10}
    res.render("view.ejs",{data:data})

}) 





// connent mangodb?
// mongodb+srv://taha:<db_password>@cluster0.d5h0ddr.mongodb.net/
const pas = "0108704401"
mongoose.connect(`mongodb+srv://taha:${pas}@cluster0.d5h0ddr.mongodb.net/`).then(()=>{
    console.log("MongoDB Connected")
}
).catch((err)=>{
    console.log(err)
}
)
// create artical 
app.post("/add-artical",async (req,res)=>{
    const artical = new Artical({
        title:req.body.title,
        body:req.body.body
    })
    try{
        const result = await artical.save()
        res.json(result)
    }catch(err){
        res.status(500).json({message:err.message})
    }
}
) 

// get all artical
app.get("/get-articals",async (req,res)=>{
    try{
        const result = await Artical.find()
        res.json(result)
    }catch(err){
        res.status(500).json({message:err.message})
    }
}
)
//get artical by id
app.get("/get-artical/:id",async (req,res)=>{
    try{
        const result = await Artical.findById(req.params.id)
        res.json(result)
    }catch(err){
        res.status(500).json({message:err.message})
    }
}
)

// delete artical by id
app.delete("/delate-artical/:id",async (req,res)=>{
    try{
        const result = await Artical.findByIdAndDelete(req.params.id)
        res.json(result)
    }catch(err){
        res.status(500).json({message:err.message})
    }
}
)

// update artical by id
app.put("/update-artical/:id",async (req,res)=>{
    try{
        const result = await Artical.findByIdAndUpdate(req.params.id,req.body)
        res.json(result)
    }catch(err){
        res.status(500).json({message:err.message})
    }
}
)

// show all artical
app.get("/show-artical",async (req,res)=>{
    try{
        const result = await Artical.find()
        // res.json(result)
        res.render("show-artical.ejs",{data:result})
    }catch(err){
        res.status(500).json({message:err.message})
    }
}
)

app.listen(3000,
//     ()=>{
//     // console.log("Express Work")
// }
)