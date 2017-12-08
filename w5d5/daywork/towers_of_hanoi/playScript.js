const Game = require("./game");

const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


const g = new Game();



g.run(reader);

reader.close();