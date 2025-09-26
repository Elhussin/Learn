type ArticalProps = {

    name: string;
    age: number;
    email: string;
    content?: string;
    children?: React.ReactNode;
};

const Artical = ({name ,age ,email, content="no medhy",children}:ArticalProps) => {
 console.log(name ,age ,email, content,children);
    return (
        <div className="artical">
       
        <h1>Hello mr {name}</h1>
        <p>Your Age is {age}</p>
        <p>Your Email is {email}</p>
        <p>{content}</p>
        <hr />
        <h2>Children</h2>
        <div className="children">
            {children}  
            </div>
        <hr />
        </div>
    );
    }
export default Artical;