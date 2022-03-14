pragma solidity ^0.8.10;

import "@chainlink/contracts/src/0.6.0/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/0.6.0/vendor/SafeMathChainlink.sol";

contract FundPleaseWithOracle {

    using SafeMathChainlink for uint256;
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
        require(funders.length == 0, "Data did not clear."); // Would it be possible for money to be stuck forever ???
        payable(msg.sender).transfer(address(this).balance);
    }

}