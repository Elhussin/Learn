import { useState } from "react";   
type formData = {
    name: string; //text input
    email: string; //email input
    age: number;  //number input
    descriptian: string; //textarea input
    workState: boolean; //checkbox input
    favoriteColor?: string;  //select input
    isMarride?: boolean; //radio input

    
}
const selectColor: { value: string; label: string }[] = [
    { value: "red", label: "Red" },
    { value: "green", label: "Green" },
    { value: "blue", label: "Blue" },
    { value: "yellow", label: "Yellow" },
];
const Form2 = () => {
const [inputData, setInputData] = useState<formData>({
    name: '',
    email: '',
    age: 0,
    descriptian: '',
    workState: false,
    favoriteColor: '',
    isMarride: false,

  });

const hendeSubmit = (e: React.FormEvent<HTMLFormElement>) : void => {
    e.preventDefault();
    console.log(inputData);         

}
const styles = {
    border: "2px solid red",
    width: "100px",
    height: "30px",
    margin: "10px"
}

return (
<form onSubmit={hendeSubmit}> 
    <div className="form flex flex-col gap-2">
    <input type="text" style={{border:"2px solid red"}} value={inputData.name} onChange={(e)=>{setInputData({...inputData,name:e.target.value})}}  />
    <input type="email" style={styles} value={inputData.email} onChange={(e)=>{setInputData({...inputData,email:e.target.value})}}  />
    <input  style={styles}  type="number" value={inputData.age} onChange={(e)=>{setInputData({...inputData,age:Number(e.target.value)})}}  />
    <textarea  style={styles}   name="" id="" value={inputData.descriptian} onChange={(e)=>{setInputData({...inputData ,descriptian: e.target.value})}}></textarea>
    <input type="checkbox" style={styles} checked={inputData.workState} onChange={(e)=>{setInputData({...inputData,workState: e.target.checked})}} />
    <label htmlFor="">Work</label>
    <select style={styles} value={inputData.favoriteColor} onChange={(e)=>{setInputData({...inputData,favoriteColor: e.target.value})}} >
        <option value="">Select Color</option>
        {selectColor.map((color)=>(
            <option key={color.value} value={color.value}>
                {color.label}
            </option>
        ))}
    </select>
    <div>
        <input type="radio" name="isMarride" value="true" checked={inputData.isMarride } onChange={(e)=>{setInputData({...inputData,isMarride: e.target.checked})}} />
        <label htmlFor="">Married</label>
        <input type="radio" name="isMarride" value="false" checked={inputData.isMarride } onChange={(e)=>{setInputData({...inputData,isMarride: e.target.checked})}} />
        <label htmlFor="">Single</label>
    </div>
    <input id="isMarride" type="radio" style={styles} checked={inputData.isMarride} onChange={(e)=>{setInputData({...inputData,isMarride: e.target.checked})}} />
    <label htmlFor="isMarride">isMarride</label>
    </div>
    <button type="submit" style={styles}>Submit</button>
    </form>
)

}

export default Form2;