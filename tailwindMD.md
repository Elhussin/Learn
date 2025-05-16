# Tailwind CSS

## Installation
```shell
npm install tailwindcss @tailwindcss/cli
```
### Check version
```shell
npm list tailwindcss
``` 

### ❌  Don't Use this for init tailwind.config.js
```shell
npx tailwindcss init  # this is for old version
```

### Create input.css
```shell
input.css
```

### ✅  Add Tailwind directives to input.css
```shell
@import "tailwindcss";
```


### ❌  Don't Use this in input.css
* @tailwind base;
* @tailwind components;
* @tailwind utilities;


### Build output.css 
```shell
npx @tailwindcss/cli -i ./src/input.css -o ./src/output.css --watch
```

#### Creat command in package.json
>  Add command in package.json 
```json
"scripts": {
    "build-css": "npx @tailwindcss/cli -i ./src/input.css -o ./src/output.css --watch"  
  }
```

> Run command
```shell
npm run build-css
```

### Editor Tool
- [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)

- [Prettier plugin](https://github.com/tailwindlabs/prettier-plugin-tailwindcss)

### Add output css to html
```html
<link href="./output.css" rel="stylesheet">
```

