
# Next.js Summary

## 🛠️ Create a Next.js App
```bash
npx create-next-app@latest
npx create-next-app@latest optics_next --typescript
788
```
# تثبيت الحزم الأساسية
pnpm add next react react-dom

# تثبيت تبعيات التطوير
pnpm add -D typescript @types/react @types/node

# تثبيت حزم إضافية
pnpm add axios date-fns


## ▶️ Run the App
```bash888
npm run dev
```
5
---

## 📄 Create Pages (App Router)
- Inside the `app/` folder.
- To create a page: create a folder named after the page, then add a `page.tsx` or `page.js` file inside.

### 📌 Dynamic Pages
- Example of a dynamic page (e.g., `/post/1`):
```
app/post/[id]/page.tsx
```

---

## 🧩 Create Components
- Create a `components/` folder.
- For each component, create a dedicated folder and add a `Component.tsx` or `Component.js` file inside.

---

## 🔍 Metadata (SEO Optimization)
- Add inside each page or in the `layout.tsx` file.
```ts
export const metadata = {
  title: "Article",
  description: "Article Page",
}
```

---

## ⚙️ Component Types

### ✅ Server Components
- Rendered on the server.
- Do not use `useState` or `useEffect`.
- By default, components in Next.js are server components.

### ✅ Client Components
- Rendered in the browser.
- Require `useState` or `useEffect`.
- Must include the directive:
```ts
"use client"
```

---

## 🧠 Rendering Methods

### 🔄 SSR - Server Side Rendering
- Rendered on the server for each request.
```ts
fetch(url, { cache: "no-store" })
```

### 🧊 SSG - Static Site Generation
- Rendered at build time.
```ts
fetch(url, { cache: "force-cache" })
```

### 🔁 ISR - Incremental Static Regeneration
- Combination of SSR and SSG.
```ts
fetch(url, {
  next: { revalidate: 60 }
})
```

---

## 🚦 Loading State
- Use `<Suspense>` in client components to show a component while loading data:
```tsx
<Suspense fallback={<div>Loading...</div>}>
  <PostViews postid={id} />
</Suspense>
```

---

## 🚀 Deploy to Vercel
1. Push the project to GitHub.
2. Create an account at [vercel.com](https://vercel.com)
3. Connect your GitHub account.
4. Select your repository.
5. Click **Deploy**.

---

## 🧭 Routing in Next.js

### Using `<Link>` for Navigation
```tsx
import Link from 'next/link'

<Link href="/about">About</Link>
```

### Programmatic Navigation
```tsx
'use client'
import { useRouter } from 'next/navigation'

const router = useRouter()
router.push('/dashboard')
```

---

## 📦 API Routes (in `app/api/`)
- Create API endpoints inside `app/api/your-endpoint/route.ts`
```ts
// app/api/hello/route.ts
export async function GET() {
  return new Response(JSON.stringify({ message: "Hello from API" }), {
    status: 200,
  })
}
```

---

## 🔐 Authentication (e.g., using next-auth)
```bash
npm install next-auth
```
- Configure `next-auth` in `app/api/auth/[...nextauth]/route.ts`
- Use `SessionProvider` and `useSession` in components.

---

## 🗃️ Data Fetching with SWR
```tsx
import useSWR from 'swr'

const fetcher = url => fetch(url).then(res => res.json())
const { data, error } = useSWR('/api/data', fetcher)
```

---

## 🌐 Internationalization (i18n)
- Enable in `next.config.js`
```js
i18n: {
  locales: ['en', 'fr', 'ar'],
  defaultLocale: 'en',
}
```

---

## ⚖️ App Router vs Pages Router

| Feature            | App Router           | Pages Router         |
|--------------------|----------------------|----------------------|
| Folder Structure   | `app/`               | `pages/`             |
| Metadata Handling  | Built-in             | Custom Head usage    |
| Routing            | File-based + layouts | File-based only      |
| Server Components  | Supported            | Not supported        |
| Data Fetching      | `fetch`, `revalidate`| `getStaticProps` etc |

---

## ⚙️ Performance Optimization

### Image Optimization
```tsx
import Image from 'next/image'

<Image src="/logo.png" width={100} height={100} alt="Logo" />
```

### Code Splitting and Lazy Loading
```tsx
import dynamic from 'next/dynamic'

const DynamicComponent = dynamic(() => import('./HeavyComponent'), {
  loading: () => <p>Loading...</p>,
})
```

---

## 🧪 Testing with Jest & RTL
- Install: `npm install jest @testing-library/react @testing-library/jest-dom`
- Add test files with `.test.tsx` extension.

---

## 📁 Environment Variables
- Create `.env.local`
```
NEXT_PUBLIC_API_URL=https://api.example.com
```

- Use in code:
```ts
process.env.NEXT_PUBLIC_API_URL
```

