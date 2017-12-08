class Clock {
  constructor() {
    const date = new Date(); 
    this.hours = date.getHours();
    this.mins = date.getMinutes();
    this.secs = date.getSeconds();
    this.printTime();
    setInterval(this._tick.bind(this), 1000); //may need arguments
  }

  printTime() {
    let timeArr = [this.hours, this.mins, this.secs];
    for (let i = 0; i < timeArr.length; i++) {
      if (timeArr[i] < 10){
        timeArr[i] = `0${timeArr[i]}`; 
      } else {
        timeArr[i] = `${timeArr[i]}`;
      }
    }
    let time = timeArr[0] + ':' + timeArr[1] + ":" + timeArr[2];
    console.log(time);
  }

  _tick() {
    // 1. Increment the time by one second.
    if (this.secs < 59){
      this.secs ++;
    } else if (this.mins < 59) {
      this.secs = 0;
      this.mins ++;
    } else if (this.hours < 23) {
      this.secs = 0;
      this.mins = 0;
      this.hours ++;
    } else {
      this.secs = 0;
      this.mins = 0;
      this.hours = 0;
    }
    // 2. Call printTime.
    this.printTime();
  }
}

const clock = new Clock();

 