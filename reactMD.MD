# React
### install Node 
- [Node](https://nodejs.org/en/download/)
- check node version `node -v`


### install react

```bash
npx create-react-app my-app
```

### install react With typeScript
```bash
npx create-react-app react-ts --template typescript

# create react with vite

npm create vite@latest my-app -- --template react-ts 
```

### install tailwindcss
```bash

npm install tailwindcss @tailwindcss/postcss postcss

```
### config postcss
> postcss.config.mjs
```bash
const config = {
  plugins: {
    "@tailwindcss/postcss": {},
  },
};
export default config;
```

### Run App
```bash
npm start
```


### Component 
- it's a function that returns a html
- use it to splite code for a better organization
- use it to reuse code


### jsx 
- it's a javascript xml
- it's a syntax extension for javascript
- it's a way to write html in javascript

### add style in component
- use inline style
- use css file
- use tailwindcss
```
let style = {
    color: "red",
    fontSize: "20px"
}
<h1 style={style}>Hello</h1>

<h1 className="text-4xl font-bold text-blue-600">Hello Tailwind with React!</h1>
<div style={{color: "red", fontSize: "20px"}}>Inline style</div>
```


### Props
- it's a data that pass to a component
- use it to make component dynamic

### State
- it's a data that can change
- it's a way to make component dynamic

# react
### add props 
### add childern 
### condinatl rendering : 
rendering :convert elment to view
### terniery oprtore

- stats & stats mangment

- dom : document opject module
- react build vertical dom 
- rerender : updte the compnent change          

# react hook 
- use 



* install eslint
```
pnpm  install --save-dev eslint-plugin-react-dom
pnpm  install --save-dev eslint-plugin-react-x
```