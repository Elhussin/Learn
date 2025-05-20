"use strict";
let username = "Ahmed";
let age = 35;
let work = true;
let posteian = "Manger";
posteian = 35;
console.log("Username", username);
console.log("Age", age);
console.log("Work", work);
console.log("Posteian", posteian);
let test = "Exmpel";
test = 35;
test = true;
console.log("Test", test);
let numbers = [1, 2, 3];
let strings = ["a", "b"];
let mixed = [1, "a"];
let nested = [1, "a", ["x", "y"]];
let nums = [1, 2, 3];
console.log("Array Annotations: Number", numbers);
console.log("Array Annotations: String", strings);
console.log("Array Annotations: Mixed", mixed);
console.log("Array Annotations: Nested", nested);
console.log("Array Annotations: Nums", nums);
function printMessage(name, mesg) {
    if (mesg) {
        return `hello ${name}`;
    }
    return "No Entery ";
}
console.log(printMessage("Ali", true));
console.log(printMessage("Ahmed", false));
function welcomeMessage(name, mesg = true, age = 0) {
    if (mesg) {
        return `Hello ${name} -Age: ${age}`;
    }
    return "No Message";
}
console.log(welcomeMessage("Hassen"));
console.log(welcomeMessage("Ahmed", false));
console.log(welcomeMessage("Ali", true, 35));
function total(type, ...num) {
    let result = 0;
    num.forEach((num) => { result += num; });
    return `Total for ${type} :${result}`;
}
console.log(total("Sales", 1, 2, 3));
console.log(total("Income", 1, 2, 3, 4, 5));
const arrowFunc = (num1, num2) => num1 * num2;
console.log("Arrow Functian Resualt", arrowFunc(5, 2));
const AnonymousFunc = function (num1, num2) {
    return num1 + num2;
};
function voidType(msg) {
    console.log(msg);
}
voidType("hello");
console.log("Anonymous Function Resualt", AnonymousFunc(10, 2));
let age2 = 35;
const getactuan = function (btn) {
    console.log("UP actin " + btn.Up);
    console.log("Right Actin " + btn.right);
    console.log("Down Action " + btn.down);
    console.log("left Action " + btn.left);
};
getactuan({ Up: "gumb", right: "right", down: "set", left: "left" });
const lestButtons = { Up: "gumb", down: "set", left: "left", move: true };
console.log(lestButtons);
let empolyee = ["Ali", 1000, true];
console.log(empolyee);
empolyee[0] = "Ahmed";
console.log(empolyee);
const [Name, Age, Work] = empolyee;
console.log("Destructuring: ", Name, Age, Work);
var Colors;
(function (Colors) {
    Colors["Red"] = "#FF0000";
    Colors["Green"] = "#00FF00";
    Colors["Blue"] = "#0000FF";
})(Colors || (Colors = {}));
console.log("Enum: ", "#FF0000");
const funcEnum = (x) => {
    return x * 2;
};
var Scoure;
(function (Scoure) {
    Scoure[Scoure["A"] = 1] = "A";
    Scoure[Scoure["B"] = 2] = "B";
    Scoure[Scoure["C"] = 3] = "C";
    Scoure["d"] = "#FF00001";
    Scoure[Scoure["fun"] = funcEnum(5)] = "fun";
})(Scoure || (Scoure = {}));
console.log("Enum: ", Scoure.d, Scoure.fun);
const str = 1234;
const str2 = str;
const person = { name: "elhussin", age: 35, work: true, skills: { one: "Html", two: "CSS" } };
console.log("Object: ", person.name);
console.log("Object: ", person.age);
console.log("Object: ", person.work);
console.log("Object: ", person.skills);
const person2 = {
    name: "Ahmed", age: 35,
    work: true,
    skills: { one: "Java", two: "CSS" },
    seyHello: () => `Hello ${person2.name}`,
    selleryWitTax: (num) => num * 0.8
};
console.log("Interface", person2.name);
console.log(person2.age);
console.log(person2.work);
console.log(person2.skills);
console.log(person2.seyHello());
console.log(person2.selleryWitTax(1000));
const setting = { theme: true, font: "Arial", sidebar: true };
console.log(setting);
const setting2 = { theme: true, font: "Arial", sidebar: true, rool: "admin" };
console.log(setting2);
class User {
    constructor(_name, age, work) {
        this._name = _name;
        this.age = age;
        this.work = work;
        this.seyHello = () => `Hello ${this._name}`;
    }
    selleryWitTax(num) {
        return num * 0.8;
    }
    get userName() {
        return this._name;
    }
    set userName(newName) {
        this._name = newName;
    }
}
const user = new User("Ali", 35, true);
console.log(user.userName);
user.userName = "Ahmed";
console.log(user.userName);
console.log(user.seyHello());
console.log(user.selleryWitTax(1000));
class TryStatic {
    static increment() {
        console.log(`${this.count} objects created `);
    }
    constructor(name) {
        this.name = name;
        TryStatic.count++;
    }
}
TryStatic.count = 0;
let static1 = new TryStatic("static1");
let static2 = new TryStatic("static2");
let static3 = new TryStatic("static3");
TryStatic.increment();
class UserSetting {
    constructor(username, theme, font) {
        this.username = username;
        this.theme = theme;
        this.font = font;
    }
    save() {
        console.log("User setting saved");
    }
    update() {
        console.log("User setting updated");
    }
}
const userSetting = new UserSetting("elhussin", true, "Arial");
userSetting.save();
userSetting.update();
class Food {
    constructor(title, price) {
        this.title = title;
        this.price = price;
    }
}
class Pizza extends Food {
    constructor(title, price) {
        super(title, price);
    }
    getCookingTime() {
        console.log("Cooking time For Pizza: 30 minutes");
    }
}
class Burger extends Food {
    constructor(title, price) {
        super(title, price);
    }
    getCookingTime() {
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
class Player {
    constructor(name) {
        this.name = name;
    }
    play() {
        console.log(`${this.name} is playing`);
    }
    attack() {
        console.log(`Attacking Now`);
    }
}
class Goalie extends Player {
    constructor(name, spears) {
        super(name);
        this.spears = spears;
    }
    attack() {
        console.log("Attaking With Spear");
        this.spears -= 1;
    }
}
class Amazon extends Player {
    constructor(name, axeDurability) {
        super(name);
        this.axeDurability = axeDurability;
    }
    attack() {
        super.attack();
        console.log("Attaking With Axe");
        this.axeDurability -= 1;
    }
}
const goalie = new Goalie("Goalie", 10);
const amazon = new Amazon("Amazon", 10);
console.log("Player: ", goalie.name, amazon.name);
goalie.attack();
amazon.attack();
function returnType(arg) {
    return arg;
}
console.log(returnType("Elzero"));
console.log(returnType(123));
console.log(returnType(true));
console.log(returnType([1, 2, 3]));
const genericArrow = (arg) => arg;
console.log(genericArrow("Hello"));
console.log(genericArrow(123));
console.log(genericArrow(true));
console.log(genericArrow([1, 2, 3]));
function testType(arg) {
    return `${arg} is of type ${typeof arg}`;
}
console.log(testType("Elzero"));
console.log(testType(123));
console.log(testType(true));
console.log(testType([1, 2, 3]));
console.log(testType({ name: "Elzero" }));
function multipleType(arg1, arg2) {
    return [arg1, arg2];
}
console.log(multipleType("Elzero", 123));
class GenericClass {
    constructor(value) {
        this.value = value;
    }
    getValue(msg) {
        console.log(`${msg} : ${this.value}`);
    }
}
const genericClass = new GenericClass("Elzero");
genericClass.getValue("Hello");
class collectian {
    constructor(items = []) {
        this.items = items;
    }
    add(item) {
        this.items.push(item);
    }
}
const addBoke = new collectian();
addBoke.add({ title: "Book", author: "Elzero", price: 100 });
console.log(addBoke);
const AddGame = new collectian();
AddGame.add({ title: "Game", author: "Elzero", price: 100, style: "Action" });
console.log(AddGame.items);
//# sourceMappingURL=index.js.map