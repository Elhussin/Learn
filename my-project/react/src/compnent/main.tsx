import Post from './post';
import Saide from './saide';
import {  postsData  } from '../assets/data';

    function main() {

    const showSide:boolean = true;
    const postList = postsData.map((post)=>{
        return(
            <Post key={post.id} title={post.title} content={post.content}/>
        )
    })
    return(
        <div className='grid grid-cols-3 gap-4 p-4 m-4' > 
            <div className='col-span-2'>
              <div className='grid grid-cols-1 gap-4'>  
                {postList}
                </div>
            </div>

            <div>
                {showSide ? <Saide/> : null}
         
            </div>

        </div>
    )
}

export default main;

