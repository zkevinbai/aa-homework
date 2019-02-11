function myCounter() {
    let countOne = 0;
    let countTwo = 0;

    return function Jeff(num) {
        if(num === 1){++countOne;}
        if(num === 2){++countTwo;}
        return `C1:${countOne}, C2:${countTwo}`;
    };
}

// My counter returns jeff

let func = myCounter();

func = function Jeff(num) {
    if (num === 1) { ++countOne; }
    if (num === 2) { ++countTwo; }
    return `C1:${countOne}, C2:${countTwo}`;
};

// Each of these are scoped within the same original call to myCounter()
console.log(func(1));
console.log(func(1));

console.log(func(2));
console.log(func(2));
console.log(func(2));



