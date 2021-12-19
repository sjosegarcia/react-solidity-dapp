pragma solidity ^0.8.10;

contract NestedMapping {
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr, uint _i) public view returns (bool) {
        return nested[_addr][_i];
    }

    function set(address _addr, uint _i, bool _bool) public {
        nested[_addr][_i] = _bool;
    }

    function remove(address _addr, uint _i) public {
        delete nested[_addr][_i];
    }
}