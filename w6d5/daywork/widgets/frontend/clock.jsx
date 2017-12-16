import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
    this.clockId = null;
  }

  tick () {
    this.setState( { time: new Date() } );
  }

  componentDidMount () {
    this.clockId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.clockId);
  }

  render () {
    const {time} = this.state;
    // console.log(time);
    // debugger
    return (
      <marquee className="clock-container">
        <h1>Clock</h1>
        <p>{time.toTimeString().slice(0,9)}</p>
        <p>{time.toDateString()}</p>
      </marquee>
    );
  }
}


export default Clock;
