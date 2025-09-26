export const todo: {id:number, title:string}[]=[
    {id:1, title:"Todo",},
    {id:2, title:"Todo 2",},
    {id:3, title:"Todo 3",},
    {id:4, title:"Todo 4",},

]

export const postsData: {id:number, title:string, content:string}[]=[
    {id:1, title:"Post 1", content:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatibus."},
    {id:2, title:"Post 2", content:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatibus."},
    {id:3, title:"Post 3", content:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatibus."},
    {id:4, title:"Post 4", content:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatibus."}

]
const icon=  <i className=" text-amber-300 pi pi-face-smile "></i>
export const SideData: {id:number, title:string, content:React.ReactNode}[]=[
    {id:1, title:"New", content:
                <div>
                {icon}
                {icon}
                {icon}
                <img style={{width:"100%"}} src="https://www.w3schools.com/w3images/lights.jpg" alt="RECT Shape" />

     </div>
    },
    {id:2, title:"Last", content:
        <div>
        {icon}
        {icon}
        {icon}
     </div>
        },
    {id:3, title:"Spesial", content:'***'}
]