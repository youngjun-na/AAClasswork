class Clock {
  constructor() {
    let date = new Date();
    this.hour = date.getHours();
    this.minute = date.getMinutes();
    this.second = date.getSeconds();
    this.printTime();
    console.log(this);
    //a function takes in args (cb function and time) and invokes the cb function
    setInterval(this._tick.bind(this), 1000);
    console.log(this);
  }

  printTime() {
    let time = `${this.hour}:${this.minute}:${this.second}`;
    console.log(time);
  }

  _tick() {
    this.second += 1;
    if (this.second === 60) {
      this.second = 0;
      this.minute += 1;
    }
    if (this.minute === 60) {
      this.minute = 0;
      this.hour += 1;
    }

    this.printTime();
  }
 
}
const clock = new Clock();

