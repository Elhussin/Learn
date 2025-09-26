import type { JSX } from "react";

export default function List({list}: { list: { id: number; title: string }[] }) {

    // const view :string[]= list.map((task:string|number)=>{
    //      return <li key={task.id}>{task.title}</li>
    // })
    const view: JSX.Element[] = list.map((task: { id: number; title: string }) => {
       return <h1 className="bg-amber-200 border-4 border-amber-100 m-2" key={task.id}>{task.title}</h1>
    });
    return (
        <div className="list">
            <h1>List</h1>
            <ul>
                {view}
            </ul>
        </div>
    );

}