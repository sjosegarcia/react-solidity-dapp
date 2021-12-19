import React, { useState } from 'react';
import { ethers } from "ethers";
import Greeter from './artifacts/contracts/Greeter.sol/Greeter.json';
import './App.css';

const greeterAddress = "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512";

function App() {

  const [greeting, setGreetingValue] = useState();

  const requestAccount = async () => await window.ethereum.request({ method: ""});

  const fetchGreeting = async () => {
    if (typeof window.ethereum === 'undefined') return;
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const contract = new ethers.Contract(greeterAddress, Greeter.abi, provider);
    try {
      const data = await contract.greet();
      console.log("Data: ", data);
    } catch (err) {
      console.log("Error: ", err);
    }
  };

  const setGreeting = async () => {
    if (!greeting) return;
    if (typeof window.ethereum === 'undefined') return;
    await requestAccount();
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const contract = new ethers.Contract(greeterAddress, Greeter.abi, signer);
    const transaction = await contract.setGreeting(greeting);
    await transaction.wait();
    fetchGreeting();

  };

  return (
    <div className="App">
      <header className="App-header">
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
