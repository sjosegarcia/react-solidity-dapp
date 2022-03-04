pragma solidity ^0.8.10;

contract ViewAndPure {

    uint public x = 1;

    // View function declares that no state will be changed
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Pure functions declare that no state variable will be changed or read
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}