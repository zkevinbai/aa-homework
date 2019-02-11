"use strict";

// Phase I - JS Fundamentals

function madlibs(verb, adjective, noun){
    console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`);
}

// madlibs('make', 'best', 'guac');

function isSubstring(searchString, subString){
    console.log(searchString.includes(subString));
}

// isSubstring("time to program", "time");

// Phase II - JS Looping Constructs

function fizzBuzz(array){
    let answer = [];

    for (let i=0; i < array.length; i++){
        if (array[i]%3===0 && array[i]%15!=0) {
            answer.push(array[i])
            }
        if (array[i]%5 === 0 && array[i]%15!=0) {
            answer.push(array[i])
            }
    }

    return console.log(answer);
}

// fizzBuzz([2,4,6, 5, 15]);

function isPrime(number){
    let answer = false;

    if (number < 2){
        return console.log(answer);
    }
    for (let i=2; i<number; i++){
        if (number % i === 0){
        return console.log(answer);
        }
    }

    answer = true;
    return answer;
    // return console.log(answer);
}

// isPrime(2);
// isPrime(5);
// isPrime(115);

function sumOfNPrimes(n){
    let x = 0;
    let sum = 0;
    let i = 0;

    while(x !== n){
        if (isPrime(i)){
            x = x + 1;
            sum = sum + i;
        }
        i = i + 1;
    }

    return console.log(sum)
}

// sumOfNPrimes(100);
