import React from 'react';

const Tab = function ({ title, content, idx, selectedIdx, activateTab }) {
    if (idx === selectedIdx) {
      return (
        <li className = "tab">
          <h1>{title}</h1>
          <p>{content}</p>
        </li>
      );
    } else {
      return (
        <li className = "tab" onClick={activateTab(idx)}>
          <h1 className="inactiveTab">{title}</h1>
        </li>
      );
    }
};

//
// class Tab extends React.Component {
//   constructor(props) {
//     super(props);
//     const {title, content, idx} = props;
//
//     this.state = {index: idx};
//     this.title = title;
//     this.content = content;
//
//   }
//
//   render() {
//     return (
//       <div className="tabs-container">
//
//       </div>
//     )
//   }
// }

export default Tab;
