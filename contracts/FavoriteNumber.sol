pragma solidity ^0.8.10;

contract FavoriteNumber {

    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    mapping(address => Person) private addressToPerson;

    function store(string memory name, uint256 favoriteNumber) public {
        require(bytes(name).length > 0, "Please provide a nanme");
        require(favoriteNumber > 0, "Please provide a favorite number");
        addressToPerson[msg.sender] = Person(name, favoriteNumber);
    }

    function getPersonName() public view returns (string memory name) {
        return addressToPerson[msg.sender].name;
    }

    function getPersonFavoriteNumber() public view returns (uint256 favoriteNumber) {
        return addressToPerson[msg.sender].favoriteNumber;
    }

    function changeFavoriteNumber(uint256 favoriteNumber) public {
        require(favoriteNumber > 0, "Please provide a favorite number");
        addressToPerson[msg.sender].favoriteNumber = favoriteNumber;
    }

}