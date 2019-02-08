// Some tea? Some biscuits?
const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function teaAndBiscuits(callback){
    reader.question("Would You Like Tea?", function(answer1){
        reader.question("Would You Like Biscuts?", function (answer2){
            const ans1 = answer1;
            const ans2 = answer2;

            callback(ans1, ans2);
        });
    });
}

// WHY CANT YOU SPLIT OUT QUESTIONS

// function teaAndBiscuits(callback) {
//     let ans1=false;
//     let ans2=false;

//     reader.question("Would You Like Tea?", function (answer1) {
//        ans1 = answer1;});

//     reader.question("Would You Like Biscuts?", function (answer2) {
//         ans2 = answer2;});
    
//     if (ans1 !== false && ans2 !== false ) {
//     callback(ans1, ans2);}
// }

teaAndBiscuits(function(arg1, arg2){
    console.log(arg1);
    console.log(arg2);
    console.log(`So you ${arg1} want tea and you ${arg2} want biscuits.`);
    reader.close();
});
