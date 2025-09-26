type ButtonProps = {
    id?: number;
    label: string;
    fun?: () => void;
    children?: React.ReactNode;
};
const Buttoun = ({id,label, fun ,children}:ButtonProps) => {
    if (label == "" || label == null) {
        return null;
    }
    return (

        <div className="grid grid-cols-1 gap-2 m-2 p-2">
        <button key={id} onClick={fun} className={'bg-fuchsia-700 text-white font-bold py-2 px-4 rounded border-2 border-amber-950 hover:bg-fuchsia-900'}>
           {label}
          
            <div className="children">
                {children}
            </div>
        </button>
        </div>
  
        )
        }
    
    
export default Buttoun;