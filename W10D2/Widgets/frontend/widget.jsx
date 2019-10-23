import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

class Widget extends React.Component {
  constructor(props) {
    super(props),
    this.state = {
      tabinfo: [{
        title: "one",
        content: "this is the first"
      }, {title: "two", content: "this is the second"}, {title: "three", content: "number 3"}, {title: "four", content: "the last for now"}]
    }
  }
  render() {
    return (
      <div>
        <Clock />
        <br />
        <Tabs tabinfo = {this.state.tabinfo} />
        <br />
        {/* <Weather /> */}
      </div>
    );
  }

}

export default Widget;