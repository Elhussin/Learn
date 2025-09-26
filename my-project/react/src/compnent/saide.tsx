import Buttoun from "./button";
import 'primeicons/primeicons.css';
import {SideData} from "../assets/data";

function Saide() {
  const sideList = SideData.map((side) => {
    return (
     <Buttoun key={side.id} label={side.title} children={side.content}/>
    );
  });
  const showSide = true;             

  return (
    <div className="side border border-red-300 p-4 rounded-lg shadow-md">

      <div className="col-span-2">
        <h1 className="text-2xl font-bold">Side Bar</h1>
        <hr />
        {showSide ? sideList : null}
      </div>

    </div>
  );
}
export default Saide;