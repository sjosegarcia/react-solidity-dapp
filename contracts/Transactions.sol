// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

contract Transactions {

    event Transfer(address sender, address receiver, uint amount, string message, uint256 timestamp, string keyword);

    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    uint256 private transactionCount;
    TransferStruct[] private transactions;

    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        transactionCount += 1;
        uint time = block.timestamp;
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, time, keyword));
        emit Transfer(msg.sender, receiver, amount, message, time, keyword);
    }

    function getAllTransactiond() public view returns (TransferStruct[] memory) {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}

/**

    block.timestamp cannot be used safely or reliably

    why?

    If your block is stamped with a time too far in the future, newer blocks wont be added to it by the miners


    Your block time cannot be stamped with an earlier time than the previous (ofc)

    Difficulty is kept lowest by not stamping blokcs as earlier than they actually occur

    Powerful miners can manipulate timestamps over short period especially if they have something to gain from it

    Lower hashrate miners will produce close to accurate blocktime

 */