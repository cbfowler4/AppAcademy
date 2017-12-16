import React from 'react';
import Clock from './clock';
import Tab from './tab';
import Weather from './weather';

class Root extends React.Component {
  constructor(props) {
    super(props);
    const {tabs} = props;

    this.state = { activeTab: 0};
    this.tabs = tabs;
    this.activateTab = this.activateTab.bind(this);
  }

  activateTab (idx) {
    return (e) => {
      this.setState({ activeTab: idx });
    };
  }

  render() {
    // debugger
    const tabs = this.tabs.map((tab, idx) => (
      <Tab
        title = {tab.title}
        content = {tab.content}
        idx = {idx}
        key = {idx}
        selectedIdx = {this.state.activeTab}
        activateTab = {this.activateTab}
        />
    ));


    return (
      <div className="widgets-container">
        <marquee className = "clock-marquee">
          <Clock />
        </marquee>

        <marquee direction="up" className = "tabs-marquee" truespeed="40" scrolldelay="40">
        <ul className="tabs-container">
          {tabs}
        </ul>
        </marquee>

        <marquee direction="left" className="weather-marquee">
          <Weather />
        </marquee>
      </div>
    );
  }
}

export default Root;
