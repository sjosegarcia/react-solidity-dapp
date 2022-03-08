pragma solidity ^0.8.10;

contract FundPlease {

    mapping(address => uint256) public fundedAmount;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function fundContract() public payable {
        fundedAmount[msg.sender] += msg.value;
    }
}