pragma solidity ^0.8.10;

contract Function {

    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2); //returns tuple
    }

    function named() public pure returns (uint x, bool b, uint y) { //return param can be named
        return (1, true, 2);
    }

    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2; //return keyword can be omitted in this case
    }

    function destructuringAssignments() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();

        //values can be left out
        (uint x, , uint y) = (4, 5, 6);
        return (i, b, j, x, y);
    }


}