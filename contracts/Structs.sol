pragma solidity ^0.8.10;

contract Struct {

    struct Structss {
        string text;
    }

    Structss[] public structs;

    function create(string memory _text) public { //Three ways to initialize a struct
        structs.push(Structss(_text));
        structs.push(Structss({text: _text}));
        Structss memory structz;
        structz.text = _text;
        structs.push(structz);
    }
}