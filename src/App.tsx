import React, { useState } from "react";
import { ethers } from "ethers";
import Greeter from "./artifacts/contracts/Greeter.sol/Greeter.json";
import "./App.css";

const greeterAddress = "0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9";

function App(): JSX.Element {
	const [greeting, setGreetingValue] = useState<string | null>();

	const requestAccount = async () =>
		await window.ethereum.request({ method: "eth_requestAccounts" });

	const fetchGreeting = async () => {
		if (typeof window.ethereum === "undefined") return;
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
		if (typeof window.ethereum === "undefined") return;
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
				<button onClick={fetchGreeting}>Fetch Greeting</button>
				<button onClick={setGreeting}>Set Greeting</button>
				<input
					onChange={(e) => setGreetingValue(e.target.value)}
					placeholder="Set greeting"
				/>
			</header>
		</div>
	);
}

export default App;
