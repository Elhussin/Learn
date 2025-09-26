import { useState } from "react";

const Status = () => {
    const [name ,setName]= useState('John');
    console.log(useState());

    function setData(){
        if(name === 'John'){
            setName('Doe');
        }
        else{
            setName('John');
        }
    }
    return (
        <div>
            <button onClick={setData}>clike Me</button>
            <h1>{name}</h1>
        </div>
    )
}

export default Status;
