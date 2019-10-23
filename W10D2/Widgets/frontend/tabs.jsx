import React from 'react';
import TabContent from './tab_content';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.list = props.tabinfo;
    this.state = {
      selected: 0
    }
    
  }
  click(num) {
    let prev = document.querySelector(".selected")
    if (prev) prev.classList.toggle("selected");
    this.setState( {selected: num});
    let x = document.getElementById(num);
    x.classList.toggle("selected");
  }
  render () {
   
    return (
      <div className = "tab-container">
        <h1 className="title">TABS</h1>
        <div className="tabs">
          <ul className="tabs-list">
            {this.list.map((tab, idx)=> {
              if (idx === 0) {
                return <li className="tab-button selected" id={idx} onClick={() => this.click(idx)}>{tab.title}</li>
              }
              else {
                return <li className ="tab-button" id = {idx} onClick={()=> this.click(idx)}>{tab.title}</li>
              }
            })}
          </ul>
        </div>
        <div className="break"></div>
        <TabContent id={this.state.selected}
          list={this.list} />
      </div>
    )}
}

export default Tabs;