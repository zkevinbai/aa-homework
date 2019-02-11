"use strict";

// phase 1 callbacks

function titlelize(array, callback) {
    let mapArr = array.map(x => `Mx. ${x} Jingleheimer Schmidt`);

    mapArr.forEach(element => {
        callback(element);
    });
}

function printCallback(x){
    return console.log(x);
}

// titlelize(["Mary", "Brian", "Leo"], printCallback);

// phase 2 constructors, prototypes, this

// // ES5 syntax 
// function Elephant(name, height, tricks) {
//     this.name = name;
//     this.height = height;
//     this.tricks = tricks;
// }

// Elephant.prototype.trumpet = function() {
//     return console.log(`${this.name} trumpets`);
// }

// Elephant.prototype.grow = function() {
//     let height = this.height;
//     let growth = 5;
//     this.height += growth;
//     return console.log(`${this.name} grew from ${height} feet to ${this.height} feet tall`);
// }

// Elephant.prototype.addTrick= function(trick) {
//     this.tricks.push(trick);
//     return console.log(`${this.name} has learned how to ${trick}`);
// }

// Elephant.prototype.play = function() {
//     return console.log(this.tricks[Math.floor(Math.random() * this.tricks.length)]);
// }

// ES6 Syntax

class Elephant {
    constructor(name, height, tricks){
        this.name = name;
        this.height = height;
        this.tricks = tricks;
    }

    play(){
        return console.log(this.tricks[Math.floor(Math.random() * this.tricks.length)]);
    }

    trumpet(){
        return console.log(`${this.name} trumpets`);
    }

    grow(){
        let height = this.height;
        let growth = 5;
        this.height += growth;
        return console.log(`${this.name} grew from ${height} feet to ${this.height} feet tall`);
    }

    addTrick(trick){
        this.tricks.push(trick);
        return console.log(`${this.name} has learned how to ${trick}`);
    }

    static paradeHelper(elephant){
        return console.log(`${elephant.name} is trotting on parade`);
    }
}

let ganesh = new Elephant("ganesh", 15, ["jump", "paint"]);

// ganesh.play();
// ganesh.trumpet();
// ganesh.grow();
// ganesh.addTrick("horse around");
// ganesh.play();
// ganesh.play();
// ganesh.play();

// phase 3 function invocation
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
// Elephant.paradeHelper(micah);
// herd.forEach(x => Elephant.paradeHelper(x));

// phase 4 closures

let foods = "";
function noClosureDiner(order){
    function sentFoods() {
        if(order){
            foods += ` and ${order}`;
            return foods;
        }
        return "";
    }
    
    return console.log(`I'd like cheesy scrambled eggs${sentFoods()} please`);
}

// noClosureDiner();
// noClosureDiner(`chocolate chip pancakes`);
// noClosureDiner(`grits`);

function dinerBreakfast() {
    let foods = "";

    // closer func
    function closure(order) {
        if (order) {
            foods += ` and ${order}`;
        }
        console.log(`I'd like cheesy scrambled eggs${foods} please`);
    }

    if(foods === "") {
        console.log(`I'd like cheesy scrambled eggs please`);
    }

    return closure;
}

// Prompt
let bfastOrder = dinerBreakfast();
bfastOrder(`chocolate chip pancakes`);
bfastOrder(`grits`);