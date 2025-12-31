# TypeScript Guide

## ✅ Setup

### 1. Install Node.js
[Download Node.js](https://nodejs.org/en)

### 2. Check Node.js version
```shell
node -v
```

### 3. Install TypeScript globally
```shell
npm install -g typescript
```

### 4. Check TypeScript version
```shell
tsc -v
```

---

## 🚀 First Project

### 5. Create a TypeScript file
```text
index.ts
```

### 6. Check available `tsc` commands
```shell
tsc --help
```

### 7. Create a TypeScript configuration file
```shell
tsc --init
```
> This will generate a `tsconfig.json` file where you can configure TypeScript options (e.g., Strict mode, Target version).

### 8. Compile TypeScript
```shell
tsc index.ts        # Compile one file
tsc -w              # Watch all files
```

### 9. Run the compiled JavaScript
```shell
node index.js
```

---

## 🧠 Basic Types

### Primitives
```ts
let name: string = "Mohamed";
let age: number = 35;
let isWorking: boolean = true;
```

### Any vs Unknown
> **Avoid** `any` when possible. Use `unknown` for unsafe input, because it forces you to check the type before using it.
```ts
// Any: No type safety (Dangerous)
let loose: any = 4;
loose.hello(); // No compiler error, but runtime crash

// Unknown: Safe (Must check type)
let safe: unknown = 4;
// safe.toFixed(); // Error: Object is of type 'unknown'.

if (typeof safe === 'number') {
    console.log(safe.toFixed(2)); // OK
}
```

### Arrays
```ts
let numbers: number[] = [1, 2, 3];
let strings: string[] = ["a", "b"];
let mixed: (string | number)[] = ["a", 1];

// Generic Array Syntax
let nums: Array<number> = [1, 2, 3];
```

### Tuples
> Fixed length and fixed types.
```ts
let person: [string, number] = ["Ali", 30];
// person = [30, "Ali"]; // Error
```

### Enums
```ts
enum Direction {
  Up,
  Down,
  Left,
  Right
}
let move: Direction = Direction.Up; // 0
```

### Void & Never
```ts
// Void: Function returns nothing
function log(msg: string): void {
  console.log(msg);
}

// Never: Function never returns (throws error or infinite loop)
function throwError(msg: string): never {
    throw new Error(msg);
}
```

---

## 🏗️ Type Aliases & Interfaces

### Type Alias
> Best for unions, primitives, and tuples.
```ts
type ID = string | number; // Union Type
type Status = "active" | "inactive"; // Literal Union

type Coordinate = {
    x: number;
    y: number;
};

// Intersection (combining types)
type Draggable = Coordinate & {
    dragging: boolean;
};
```

### Interface
> Best for defining object shapes. Can be merged and extended (OOP style).
```ts
interface User {
    readonly id: number;   // Cannot change after creation ("const" for properties)
    name: string;
    email?: string;        // Optional property
    greet(): string;       // Method definition
}

// Extending an interface
interface Admin extends User {
    role: "admin" | "superadmin";
}
```

### Type Assertion (Casting)
> "Trust me compiler, I know the type."
```ts
let someValue: unknown = "Typescript";

// Two syntaxes:
let strLength: number = (someValue as string).length; // Recommended (JSX safe)
let strLength2: number = (<string>someValue).length;
```

---

## 🔧 Functions

### Typed Parameters & Return
```ts
function add(a: number, b: number): number {
    return a + b;
}
```

### Arrow Functions
```ts
const multiply = (a: number, b: number): number => a * b;
```

### Optional & Default Parameters
```ts
function greet(name: string, greeting: string = "Hello"): string {
    return `${greeting} ${name}`;
}
```

### Rest Parameters
```ts
function sum(...nums: number[]): number {
    return nums.reduce((a, b) => a + b, 0);
}
```

### Async Functions (Promises)
> Handling asynchronous operations.
```ts
async function fetchData(url: string): Promise<string> {
    // Imagine this is a real fetch
    return "Data loaded";
}
```

---

## 🏛️ Classes

```ts
class Player {
    // Shorthand constructor (defines and assigns properties in one step)
    constructor(
        public name: string, 
        private score: number, 
        protected readonly id: number
    ) {}

    get currentScore(): number {
        return this.score;
    }

    set currentScore(value: number) {
        if (value >= 0) this.score = value;
    }

    play(): void {
        this.score += 10;
    }
}

class Goalie extends Player {
    constructor(name: string, id: number, public spears: number) {
        super(name, 0, id); // Call parent constructor
    }

    // Override parent method
    override play(): void {
        console.log(`${this.name} is guarding the goal!`);
    }
}
```

### Access Modifiers
| Modifier | Description |
|----------|-------------|
| `public` | Accessible from anywhere (default). |
| `private` | Accessible only within the class. |
| `protected` | Accessible within the class and subclasses. |
| `static` | Belongs to the class, not the instance. |

---

## 💎 Generics
> Create reusable components that work with any type.

### Generic Function
```ts
function identity<T>(arg: T): T {
    return arg;
}
// Usage:
let output = identity<string>("myString");
let numOutput = identity(123); // Inference
```

### Generic Interface & Class
```ts
interface Box<T> {
    contents: T;
}

class Collection<T> {
    private items: T[] = [];
    
    add(item: T): void {
        this.items.push(item);
    }
    
    get(index: number): T {
        return this.items[index];
    }
}

const books = new Collection<string>();
books.add("Harry Potter");
```

---

## 🛠️ Utility Types (Essential)
> Built-in tools to transform types. You will use these often in React/Node.

### `Partial<T>`
> Makes all properties optional.
```ts
interface Todo { title: string; desc: string; }

function updateTodo(todo: Todo, fieldsToUpdate: Partial<Todo>) {
    return { ...todo, ...fieldsToUpdate };
}
```

### `Required<T>`
> Makes all properties required (opposite of Partial).

### `Readonly<T>`
> Makes all properties readonly.

### `Pick<T, Keys>`
> Selects a subset of properties (Allowlist).
```ts
type TodoPreview = Pick<Todo, "title">; // Only has 'title'
```

### `Omit<T, Keys>`
> Removes a subset of properties (Blocklist).
```ts
type TodoInfo = Omit<Todo, "desc">; // Has everything EXCEPT 'desc'
```

### `Record<Keys, Type>`
> Creates an object type with specific keys and value types.
```ts
const nameMap: Record<string, number> = {
    "Alice": 21,
    "Bob": 25
};
```

---

## 📦 Modules

### Exporting
```ts
// math.ts
export const PI = 3.14;
export interface Shape { area: number; }
export function add(a: number, b: number) { return a + b; }
```

### Importing
```ts
// app.ts
import { PI, add, type Shape } from "./math";
```

---

## ⚙️ Configuration (`tsconfig.json`)

Key settings you should know:

```json
{
  "compilerOptions": {
    "target": "ES6",            // Compile to ES6 (or ESNext)
    "module": "commonjs",       // Module system (commonjs for Node, esnext for React/Vite)
    "strict": true,             // Enable ALL strict type-checking options (Essential)
    "noImplicitAny": true,      // Error on implied 'any'
    "esModuleInterop": true,    // Better CommonJS/ES Module interop
    "skipLibCheck": true        // Skip type checking of declaration files (speeds up build)
  }
}
```

---

## 📋 Summary

| Concept | Syntax Example | Notes |
|---------|----------------|-------|
| **Union** | `string \| number` | "A or B" |
| **Intersection** | `TypeA & TypeB` | "A and B combined" |
| **Interface** | `interface User { ... }` | Object shape (OOP) |
| **Type Alias** | `type ID = ...` | Custom name for types |
| **Generics** | `Array<T>` | Types acting as parameters |
| **Narrowing** | `typeof`, `instanceof` | Refining types in conditionals |
| **Utility** | `Partial<T>`, `Pick<T, K>` | Helper types for transformations |
