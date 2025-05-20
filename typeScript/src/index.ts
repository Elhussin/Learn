
// TypeScript Exercises

// Data type annotations
let username: string = "Ahmed";
let age: number = 35;
let work: boolean = true;
let posteian: any = "Manger"; // This allows any type of data
posteian = 35; // This works correctly

console.log("Username", username);
console.log("Age", age);
console.log("Work", work);
console.log("Posteian", posteian);

// Union Type 
let test: string | number | boolean = "Exmpel";
test = 35;
test = true;
console.log("Test", test);

//Array Annotations:
let numbers: number[] = [1, 2, 3];
let strings: string[] = ["a", "b"];
let mixed: (number | string)[] = [1, "a"];
let nested: (number | string | string[])[] = [1, "a", ["x", "y"]];
// Or
let nums: Array<number> = [1, 2, 3];

console.log("Array Annotations: Number", numbers); // > [1, 2, 3]
console.log("Array Annotations: String", strings); // > ["a", "b"]
console.log("Array Annotations: Mixed", mixed); // > [1, "a"]
console.log("Array Annotations: Nested", nested); // > [1, "a", ["x", "y"]]
console.log("Array Annotations: Nums", nums);  // > [1, 2, 3]

// Function Annotations:
function printMessage(name: string, mesg: boolean): string {
    if (mesg) {
        return `hello ${name}`;
    }
    return "No Entery ";

}
console.log(printMessage("Ali", true));     // > "hello Ali"
console.log(printMessage("Ahmed", false)) // > "No Entery "

// Function Parameter & Default Value
function welcomeMessage(name: string, mesg: boolean = true, age: number = 0): string {
    if (mesg) {
        return `Hello ${name} -Age: ${age}`;
    }
    return "No Message";

}

console.log(welcomeMessage("Hassen")) // > hello Hassen -Age: 0
console.log(welcomeMessage("Ahmed", false)) // > "No Message"
console.log(welcomeMessage("Ali", true, 35)) // > "hello Ali -Age: 35"

// Rest parameters
function total(type: string, ...num: number[]): string | number {
    // This allow to pass multiple numbers
    // return can be string or number
    let result = 0;
    num.forEach((num) => { result += num })
    return `Total for ${type} :${result}`;
}
console.log(total("Sales", 1, 2, 3)); // > "Total for Sales :6"
console.log(total("Income", 1, 2, 3, 4, 5)); // > "Total for Income :15"


// Arrow Function
const arrowFunc = (num1: number, num2: number): string | number => num1 * num2;
console.log("Arrow Functian Resualt", arrowFunc(5, 2)); //> "Arrow Functian Resualt 10"

// Function Anonymous
// this is a function that is not named and is assigned to a variable
const AnonymousFunc = function (num1: number, num2: number): number {
    return num1 + num2
}

// Void
// This is a function that does not return a value
function voidType(msg: string): void {
    console.log(msg);
    // return; not necessary for void function
}
voidType("hello")

console.log("Anonymous Function Resualt", AnonymousFunc(10, 2)); // > "Anonymous Function Resualt 12"

// Data Type Alias :"اسم مستعار لل datatype"
type num = number;
let age2: num = 35;

type buttons = {
    readonly Up: string; // readonly main its read only
    right?: string; // ? main its optional
    down: string;
    left: string
}

// extend buttons type
type Lest = buttons & {
    move: boolean
}

// function that accept object of type buttons
const getactuan = function (btn: buttons) {
    console.log("UP actin " + btn.Up);
    console.log("Right Actin " + btn.right);
    console.log("Down Action " + btn.down);
    console.log("left Action " + btn.left);

}

getactuan({ Up: "gumb", right: "right", down: "set", left: "left" }) // > "UP actin gumb" "Right Actin right" "Down Action set" "left Action left"

const lestButtons: Lest = { Up: "gumb", down: "set", left: "left", move: true };
console.log(lestButtons)  // > { Up: 'gumb', right: 'right', down: 'set', left: 'left', move: true }

// tuple data type 
// tuple allow to define the type of each element in the array
let empolyee: [string, number, boolean] = ["Ali", 1000, true];
console.log(empolyee) // > ["Ali", 1000, true]
empolyee[0] = "Ahmed";
console.log(empolyee) // > ["Ahmed", 1000, true]

// Destructuring
// Destructuring is a way to extract values from an array or object and assign them to variables.
const [Name, Age, Work] = empolyee;
console.log("Destructuring: ", Name, Age, Work) // > "Destructuring: Ahmed" 1000 true


// Enum data
// Enum is a way to define a set of named constants.
const enum Colors {
    Red = "#FF0000",
    Green = "#00FF00",
    Blue = "#0000FF",
}

console.log("Enum: ", Colors.Red) // > "#FF0000"

const funcEnum = (x: number) => {
    return x * 2
}

enum Scoure {
    A = 1,
    B = 2,
    C = 3,
    d = Colors.Red + 1,  // calculate value from another enum 
    fun = funcEnum(5)   // calculate value from function is not ideal
}
console.log("Enum: ", Scoure.d, Scoure.fun) // > "Enum: #FF00001 10"





// Type Assertions
// Type Assertions is a way to tell the compiler that a value is of a specific type.
const str = 1234;
const str2 = str as number;



// Type Assertions with DOM 
// let img = document.getElementById("img") as HTMLImageElement; 
// console.log(img.src)
// let img2 =<HTMLImageElement>document.getElementById("img");
// console.log(img2.src)



// Type Annotations With Object
// readonly main its read only
// ? main its optional
const person: { readonly name: string; age?: number; work: boolean; skills: { one: string, two: string } } =
    { name: "elhussin", age: 35, work: true, skills: { one: "Html", two: "CSS" } };
console.log("Object: ", person.name)  // > "Object:  elhussin"
console.log("Object: ", person.age) // > "Object: 35"
console.log("Object: ", person.work) // > "Object: true"
console.log("Object: ", person.skills) // > "Object: { one: "Html", two: "CSS" }"

// Interfaces 
interface Person {
    readonly name: string;
    age?: number;
    work: boolean;
    skills: { one: string, two: string },
    seyHello(): string,
    selleryWitTax: (num: number) => number
}

const person2: Person =
{
    name: "Ahmed", age: 35,
    work: true,
    skills: { one: "Java", two: "CSS" },
    seyHello: () => `Hello ${person2.name}`,
    selleryWitTax: (num: number) => num * 0.8
};

console.log("Interface", person2.name)
console.log(person2.age)
console.log(person2.work)
console.log(person2.skills)
console.log(person2.seyHello())
console.log(person2.selleryWitTax(1000))

// reOpen Interface
interface Setting {
    theme: boolean;
    font: string;
}

interface Setting {
    sidebar?: boolean;
}

const setting: Setting = { theme: true, font: "Arial", sidebar: true };
console.log(setting)

// interface extends
interface Setting2 extends Setting {
    readonly rool: string;
}

const setting2: Setting2 = { theme: true, font: "Arial", sidebar: true, rool: "admin" };
console.log(setting2)



// type annotations with class

class User {

    seyHello: () => string;
    constructor(private _name: string, protected age: number, public readonly work: boolean) {

        this.seyHello = () => `Hello ${this._name}`; // use arrow function as property
    }

    // method 
    selleryWitTax(num: number): number {

        return num * 0.8;
    }

    // get And Set accessors for classes 
    // use to access private properties or update them

    get userName(): string {
        return this._name;
    }
    set userName(newName: string) {
        this._name = newName;
    }


}


const user = new User("Ali", 35, true);
// console.log("Age", user.age) // error protect 

//  use getter to access private property
console.log(user.userName)   // > "Ali"

//  use settter to update private property
user.userName = "Ahmed";
console.log(user.userName)   // > "Ahmed"

console.log(user.seyHello()) // > "Hello Ahmed"
console.log(user.selleryWitTax(1000))



// class static members

class TryStatic {
    
    static count: number = 0; // static property & can be private
    static increment(): void {
        console.log(`${this.count} objects created `)
}

constructor(public name: string) {
    TryStatic.count++;
}
}

// console.log(Static.count); // > 0 
let static1 = new TryStatic("static1");
let static2 = new TryStatic("static2");
let static3 = new TryStatic("static3");
TryStatic.increment(); // > 3 objects created 
// console.log(Static.count); // > 3


// class Implemnt Interface
// interface is a contract that a class must follow.
interface UserSettings {
    theme: boolean;
    font?: string;
    save(): void;
}

class UserSetting implements UserSettings {

    constructor(public username: string, public theme: boolean, public font?: string, ){}
    save(): void {
       console.log("User setting saved");
    }
    update(): void {
       console.log("User setting updated");
    }

}

const userSetting = new UserSetting("elhussin", true, "Arial");
userSetting.save();
userSetting.update();


// abstract class 
// abstract class is a class that cannot be instantiated.
// abstract class is a class that must be extended.
abstract class Food {
    constructor(public title: string, public price: number) {}
    abstract getCookingTime(): void;
}

class Pizza extends Food {
    constructor( title: string, price: number) {
        super(title, price); // call parent constructor
    }
    getCookingTime(): void {
        console.log("Cooking time For Pizza: 30 minutes");
    }
}

class Burger extends Food {
    constructor( title: string, price: number, ) {
        super(title, price); // call parent constructor
    }
    getCookingTime(): void {
        console.log("Cooking time For Burger: 15 minutes");
    }
}

const pizza = new Pizza("Cheese Pizza", 100);
const burger = new Burger("Cheese Burger", 50);

pizza.getCookingTime();
console.log(pizza.title);
console.log(pizza.price);

burger.getCookingTime();
console.log(burger.title);
console.log(burger.price);


// class polymorphism 
// polymorphism is a concept that allows a class to have multiple forms.


// method Overried 
// method Overried is a way to override a method in a parent class.

class Player {
    constructor(public name: string) {}
    play(): void {
        console.log(`${this.name} is playing`);
    }
    attack(): void {
        console.log(`Attacking Now`);
    }
}

class Goalie extends Player {
    constructor(name: string, public spears: number) {
        super(name); // call parent constructor
    }
    override attack(): void {
        // super.attack();
        console.log("Attaking With Spear")
        this.spears -= 1;
    }
}

class Amazon extends Player {
    constructor(name: string, public axeDurability: number) {
        super(name);
    }
    override attack(): void {
        super.attack();
        console.log("Attaking With Axe")
        this.axeDurability -= 1;
    }
}

const goalie = new Goalie("Goalie", 10);
const amazon = new Amazon("Amazon", 10);

console.log("Player: ", goalie.name, amazon.name);
goalie.attack();
amazon.attack();



// generics 
// generics is a way to create reusable components that can work with different types.

function returnType<T>(arg: T): T {
    return arg;
}

console.log(returnType<string>("Elzero"));
console.log(returnType<number>(123));
console.log(returnType<boolean>(true));
console.log(returnType<number[]>([1, 2, 3]));

// generics with Arrow functian
const   genericArrow = <T>(arg: T): T => arg;

console.log(genericArrow<string>("Hello"));
console.log(genericArrow<number>(123));
console.log(genericArrow<boolean>(true));
console.log(genericArrow<number[]>([1, 2, 3]));

function testType<T>(arg: T): string {
    return `${arg} is of type ${typeof arg}`;
}

console.log(testType<string>("Elzero"));
console.log(testType<number>(123));
console.log(testType<boolean>(true));
console.log(testType<number[]>([1, 2, 3]));
console.log(testType<{name: string}>({name: "Elzero"}))

function multipleType<T,S>(arg1: T, arg2: S): [T, S] {
    return [arg1, arg2];
}

console.log(multipleType<string, number>("Elzero", 123));


// genrica class


class GenericClass<T> {
    constructor(public value: T) {}

    getValue(msg: T) {
        console.log(`${msg} : ${this.value}`);
    }
}

const genericClass = new GenericClass<string>("Elzero");
genericClass.getValue("Hello");

// genrica type with interfaces
interface book {
    title: string;
    author?: string;
    price: number;
}
interface games extends book{
  style : string;

}

class collectian<T>{
    constructor(public items: T[] = []) {}
    add(item: T): void {
        this.items.push(item);
    }
}
const addBoke = new collectian<book>();
addBoke.add({title: "Book", author: "Elzero", price: 100});
console.log(addBoke);

const AddGame = new collectian<games>();
AddGame.add({title: "Game", author: "Elzero", price: 100, style: "Action"});
console.log(AddGame.items);

