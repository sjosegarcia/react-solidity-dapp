// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";

const main = async () => {
	// Hardhat always runs the compile task when running scripts with its command
	// line interface.
	//
	// If this script is run directly using `node` you may want to call compile
	// manually to make sure everything is compiled
	// await hre.run('compile');

	// We get the contract to deploy
	/*
	dconst Greeter = await ethers.getContractFactory("Greeter");
	const greeter = await Greeter.deploy("Hello, Hardhat!");

	await greeter.deployed();

	console.log("Greeter deployed to:", greeter.address); */

	const Transactions = await ethers.getContractFactory("Transactions");
	const transactions = await Transactions.deploy();

	await transactions.deployed();

	console.log("Transactions deployed to:", transactions.address);
};

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
	console.error(error);
	process.exitCode = 1;
});
