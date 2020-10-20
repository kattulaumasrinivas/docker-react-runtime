import React from 'react';
import logo from './logo.svg';
import './App.css';
import { render } from '@testing-library/react';

class App extends React.Component{

  constructor(props) {
    super(props);
    this.state = { data: "nodata" };
  }

  componentDidMount = () =>{
    fetch('http://localhost:3000')
      .then(response => response.json())
      .then(data => this.setState({ data:data.msg }));
  }
  render(){
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
    <div>{window.runtime.url}</div>
    <div>got infor from node:{this.state.data} </div>
        </header>
      </div>
    );
  }
}

export default App;
