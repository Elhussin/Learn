import { useState } from "react";

const Form = () => {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [age, setAge] = useState(0);
    const [result, setResult] = useState('');

    function handleSubmit(e: React.FormEvent<HTMLFormElement>) : void {
        e.preventDefault();
        console.log(name, email, age);
        setResult(`Name: ${name}, Email: ${email}, Age: ${age}`);
    }

    return (
        <>
        <form onChange={handleSubmit}>
            <input type="text" placeholder="Name" value={name} onChange={(e) => setName(e.target.value)} />
            <input type="email" placeholder="Email" value={email} onChange={(e) => setEmail(e.target.value)} />
            <input type="number" placeholder="Age" value={age} onChange={(e) => setAge(Number(e.target.value))} />
            <button type="submit">Submit</button>
        </form>
        <div>
            <h2>Result:</h2>
            <p>{result}</p>
        </div>
        </>
    )
}

export default Form;