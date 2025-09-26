type PostProps = {
  title: string;
  content: string;
}
const Post = ({title,content}:PostProps) => {
  return (
    <div className="border border-green-300 p-4 rounded-lg shadow-md">
      <h1 style={{fontSize:20 }}>{title}</h1>
      <p>{content}</p>
      <hr />
    </div>
  );
}
export default Post;
// This is a simple functional component that displays a heading and a paragraph.
// It is a good example of how to create a component in React using TypeScript.