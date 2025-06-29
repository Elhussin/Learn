# generate api types
npx openapi-typescript http://store1.localhost:8000/api/schema/ -o lib/api-types.ts

# generate api types
npx openapi-typescript-codegen --input http://store1.localhost:8000/api/schema/ --output src/api --client axios

# generate api zod

npx openapi-zod-client "http://store1.localhost:8000/api/schema/" -o src/api-zod


# Use react-hook-form To creat ui
pnpm install react-hook-form zod @hookform/resolvers

# Use @rjsf/core To creat ui
npm install @rjsf/core @rjsf/material

# Use @tanstack/react-query To creat ui
npm install @tanstack/react-query

# Use axios To creat ui
npm install axios

# Use jwt-decode To creat ui
npm install jwt-decode

# Use react-hot-toast To creat ui
npm install react-hot-toast

# Use react-toastify To creat ui
npm install react-toastify

# Use @heroicons/react To creat ui
npm install @heroicons/react

# Use @mui/material To creat ui
npm install @mui/material

# Use @mui/icons-material To creat ui
npm install @mui/icons-material

# Use @mui/x-data-grid To creat ui
npm install @mui/x-data-grid

# Use @mui/x-date-pickers To creat ui
npm install @mui/x-date-pickers



// npx ts-node scripts/generate-zod-form.ts UserRequest
// install ts-node typescript --save-dev
// pnpm install --save-dev ts-node typescript
// npx ts-node --loader ts-node/esm scripts/generate-zod-form.ts UserRequest



# clean cash
```shell
rm -rf .next && rm -rf node_modules/.cache/turbopack
```


rm -rf .next
