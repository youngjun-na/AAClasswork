import React from 'react';

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    
    };
  }
  componentDidMount() {
    this.second = setInterval(this.tick.bind(this), 1000);
  }
  componentWillUnmount() {
    clearInterval(this.second);
  }
  render() {
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    let month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    if (minutes < 10) {
      minutes = `0${minutes}`;
    }
    let seconds = this.state.time.getSeconds();
    if (seconds < 10) {
      seconds = `0${seconds}`;
    }
    return(
      <div>
        <h1 className="title">CLOCK</h1>
        <div className="clock">
          <div>
            <h2>Time:</h2>
            <h2>Date:</h2>
          </div>
          <div className="clock-box">
            <h2>  {hours}:
                  {minutes}:
                  {seconds} PDT</h2>
            <h2>  {days[this.state.time.getDay()]}, {month[this.state.time.getMonth()]} {this.state.time.getDate()}, {this.state.time.getFullYear()}</h2>
                  {/* <h2>{this.state.time.toString()}</h2> */}
          </div>
        </div>
      </div>
    
    )
  }

  tick() {
    this.setState({time: new Date()});
  }
  
}

