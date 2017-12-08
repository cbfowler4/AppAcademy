class Game {
  constructor(stacks = this.generateStack()){
    this.stacks = stacks;
  }

  generateStack(){
    return [[3, 2, 1], [], []];
  }
  
  promptMove(reader) {
    this.print();
    reader.question("Enter from: ", (startTowerIdx) => {
      reader.question("Enter to: ", (endTowerIdx) => {
        this.move(startTowerIdx, endTowerIdx);
      });
    });
  }

  move(startTowerIdx, endTowerIdx) {
    if (isValidMove(startTowerIdx, endTowerIdx)) {
      this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
    } else {
      console.log("Invalid move bruh");
    }
  }
  
  isValidMove(startTowerIdx, endTowerIdx) {
    if (((this.stacks[startTowerIdx].slice(-1)[0] < this.stacks[endTowerIdx].slice(-1)[0]) ||
     (this.stacks[endTowerIdx].length == 0)) &&
      (this.stacks[startTowerIdx].length > 0)){
      return true;
    }
    else {
      return false;
    }
  }
  
  print () {
    console.log(JSON.stringify(this.stacks));
  }
  
  isWon() {
    if (this.stacks[2].length == 3 || this.stacks[1] == 3){
      return true;
    } else {
      return false;
    }
  }
  
  run (reader) {
    while (this.isWon() == false){
      this.promptMove(reader);
    }
    this.print();
    console.log("Congratulations, you won!");
  }
}

module.exports = Game;