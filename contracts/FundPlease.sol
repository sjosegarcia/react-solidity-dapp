pragma solidity ^0.8.10;

contract FundPlease {

    mapping(address => uint256) public addressToFundAmount;
    address[] private funders;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function fundContract() public payable {
        addressToFundAmount[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not contract owner.");
        _;
    }
    function withdraw() public onlyOwner payable {
        for (uint256 i = 0; i < funders.length; i++) {
            address funder = funders[i];
            addressToFundAmount[funder] = 0;
        }
        funders = new address[](0);
        require(funders.length == 0, "Data did not clear.");
        payable(msg.sender).transfer(address(this).balance);
    }

}