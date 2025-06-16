
/my-app
├── /app
│   ├── layout.tsx               # الغلاف الأساسي للتطبيق
│   ├── page.tsx                 # الصفحة الرئيسية (/)
│   ├── /auth
│   │   ├── login
│   │   │   ├── page.tsx
│   │   │   └── form.tsx         # مكون النموذج
│   ├── /dashboard
│   │   ├── layout.tsx           # غلاف لوحة التحكم
│   │   ├── page.tsx             # dashboard الرئيسية
│   │   ├── /products
│   │   │   ├── page.tsx
│   │   │   ├── create.tsx
│   │   │   └── edit/[id].tsx
│   │   ├── /orders
│   │   │   └── page.tsx
│   └── /admin
│       └── users/page.tsx
├── /components
│   ├── ui/                      # أزرار، جداول، Inputs...
│   ├── layout/                  # شريط جانبي، رأس
│   ├── forms/                   # نماذج تسجيل الدخول، المنتج...
├── /hooks
│   ├── useAuth.ts
│   ├── useUser.ts
├── /lib
│   ├── api.ts                   # إعداد axios / fetch
│   ├── auth.ts                  # دوال تسجيل الدخول / الجلسات
│   └── constants.ts             # ثوابت عامة
├── /types
│   ├── index.ts                 # أنواع مشتركة
│   └── api.ts                   # أنواع API مثل Product, User...
├── /styles
│   └── globals.css
│   └── tailwind.config.js
├── /public
│   └── images, logos...
├── /middleware.ts              # حماية المسارات (auth check)
├── next.config.js
└── tsconfig.json
