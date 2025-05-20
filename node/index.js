const express= require("express")
// import express from "express" ;

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
    // let view =`<h1>Hell hussain<h1>`
    // res.send(view)
    // const path =__dirname +"/views/index.html"
    // res.sendFile(path)
    let data ={name:"hussan", age:10}
    res.render(view.ejs,data=data)

}) 



app.listen(3000,
//     ()=>{
//     // console.log("Express Work")
// }
)