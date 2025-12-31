# Tailwind CSS (v4) Guide

## 🛠️ Setup & Installation

### 1. Install via NPM
```shell
npm install tailwindcss @tailwindcss/cli
```

### 2. Create CSS Entry File
Create a file (e.g., `src/input.css`) and add the import:
```css
@import "tailwindcss";
```
> **Note:** In v4, you do **not** use the old directives (`@tailwind base`, etc.). Just the import.

### 3. Build Command
Run the CLI tool to compile your CSS.
```shell
npx @tailwindcss/cli -i ./src/input.css -o ./src/output.css --watch
```

**Recommended:** Add to `package.json` scripts:
```json
"scripts": {
  "dev": "npx @tailwindcss/cli -i ./src/input.css -o ./src/output.css --watch"
}
```

### 4. Link in HTML
```html
<link href="./src/output.css" rel="stylesheet">
```

---

## 📐 Layout & Flexbox

### Flexbox Essentials
| Class | CSS Property | Description |
|-------|--------------|-------------|
| `flex` | `display: flex;` | data-allow-mismatch |
| `flex-col` | `flex-direction: column;` | Stack items vertically |
| `items-center` | `align-items: center;` | Center vertically |
| `justify-center` | `justify-content: center;` | Center horizontally |
| `justify-between` | `justify-content: space-between;` | Space items apart |
| `flex-1` | `flex: 1 1 0%;` | Fill remaining space |
| `gap-4` | `gap: 1rem;` | Gap between items |

**Example:**
```html
<div class="flex items-center justify-between gap-4">
  <div>Item 1</div>
  <div>Item 2</div>
</div>
```

### Grid
| Class | CSS Property |
|-------|--------------|
| `grid` | `display: grid;` |
| `grid-cols-3` | `grid-template-columns: repeat(3, minmax(0, 1fr));` |
| `col-span-2` | `grid-column: span 2 / span 2;` |

---

## 📏 Spacing & Sizing

Tailwind uses a 4px scale by default. `1` = `0.25rem` (4px).

### Padding & Margin
*   `p-{size}`: Padding all sides.
*   `px-{size}`: Padding Left & Right.
*   `py-{size}`: Padding Top & Bottom.
*   `m-{size}`: Margin (same logic).

| Class | Pixels (approx) |
|-------|-----------------|
| `p-1` | 4px |
| `p-2` | 8px |
| `p-4` | 16px |
| `p-8` | 32px |
| `px-4` | 16px (Left/Right) |

### Width & Height
*   `w-full` → `width: 100%`
*   `h-screen` → `height: 100vh`
*   `w-{size}` → Fixed width (e.g., `w-16` = 4rem).
*   `max-w-{size}` → Max width (e.g., `max-w-md`).

---

## 🎨 Typography & Colors

### Text Styles
| Class | Description |
|-------|-------------|
| `text-sm`, `text-base`, `text-lg` | Font size |
| `font-bold`, `font-medium` | Font weight |
| `text-center`, `text-left` | Alignment |
| `uppercase`, `capitalize` | Transformation |

### Colors
Format: `{property}-{color}-{shade}`
*   Text: `text-blue-500`
*   Background: `bg-red-600`
*   Border: `border-gray-200`

**Common Colors:** `slate`, `gray`, `zinc`, `red`, `orange`, `amber`, `yellow`, `lime`, `green`, `emerald`, `teal`, `cyan`, `sky`, `blue`, `indigo`, `violet`, `purple`, `fuchsia`, `pink`, `rose`.

---

## 📱 Responsive Design

Prefix any utility with the screen size. **Mobile-first** logic means base classes apply to mobile, and prefixes override on larger screens.

| Prefix | Breakpoint |
|--------|------------|
| (none) | Mobile (< 640px) |
| `sm:` | >= 640px |
| `md:` | >= 768px |
| `lg:` | >= 1024px |
| `xl:` | >= 1280px |

**Example:**
```html
<!-- Red on mobile, Green on Tablet, Blue on Desktop -->
<div class="bg-red-500 md:bg-green-500 lg:bg-blue-500">
  Responsive Box
</div>
```

---

## 🖱️ States & Interactivity

### Common States
*   `hover:{class}`
*   `focus:{class}`
*   `active:{class}`
*   `disabled:{class}`

```html
<button class="bg-blue-500 hover:bg-blue-700 active:scale-95 disabled:opacity-50">
  Click Me
</button>
```

### Group Hover
Style a child when the parent is hovered.
1.  Add `group` to parent.
2.  Add `group-hover:{class}` to child.

```html
<div class="group p-4 border hover:bg-black">
  <p class="text-black group-hover:text-white">
    I change when parent is hovered!
  </p>
</div>
```

---

## 🌙 Dark Mode

In v4, dark mode often detects system preference automatically or uses a variant.

```html
<div class="bg-white text-black dark:bg-gray-900 dark:text-white">
  Automatic Dark Mode
</div>
```

---

## 🧩 Directives (CSS Files)

### @apply
Use to extract repeated patterns into a custom CSS class.
> **Warning:** Don't overuse this. It defeats the purpose of utility classes.

```css
/* input.css */
@import "tailwindcss";

.btn-primary {
  @apply bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600;
}
```

### v4 Configuration (Theme)
In Tailwind v4, you configure the theme using standard CSS variables inside the `@theme` directive in your CSS file, not a JS config file.

```css
@import "tailwindcss";

@theme {
  --color-brand-primary: #ff5733;
  --font-family-sans: "Inter", sans-serif;
  
  /* Extend existing breakpoints */
  --breakpoint-3xl: 1920px;
}
```

Then use it in HTML:
```html
<div class="bg-brand-primary font-sans">
  Custom Theme!
</div>
```

---

## 🚀 VS Code Extensions
1.  **Tailwind CSS IntelliSense**: Autocomplete and linting.
2.  **Prettier**: Install `prettier-plugin-tailwindcss` to automatically sort your classes.
