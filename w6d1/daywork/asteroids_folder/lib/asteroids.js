const GameView = require('./game_view');
const Game = require('./game');

document.addEventListener("DOMContentLoaded", function(event) {
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext('2d');
  const game = new Game(1000, 1000, 10);
  const gameView = new GameView(game, ctx);
  gameView.start();

  for(var i=0; i<1000000000; i++)
  {}
});
