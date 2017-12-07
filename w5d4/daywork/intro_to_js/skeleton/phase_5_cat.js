function Cat (name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}`;
};


const simba = new Cat('Simba', 'Mufasa');
const rafiki = new Cat('Rafiki', 'Mufasa');
// 
// console.log(simba.cuteStatement());
// console.log(rafiki.cuteStatement());


Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}`;
};

// 
// console.log(simba.cuteStatement());
// console.log(rafiki.cuteStatement());


Cat.prototype.meow = function () {
  console.log(`${this.name} goes meow!!!!`);
};

simba.meow = function () {
  console.log(`${this.name} goes ROAR!!!!`);
};

// rafiki.meow();
// simba.meow();