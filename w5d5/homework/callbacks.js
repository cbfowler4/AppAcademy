function hammer() {
  alert(`${time} is hammertime`);
}

function hammerTime(time) {
  const new_time = time;
  window.setTimeout(hammer, new_time);
}