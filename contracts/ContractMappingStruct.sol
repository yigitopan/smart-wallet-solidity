//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ContractMappingStruct {

    struct Transaction {
        uint amount;
        uint timestamp;
    }

     struct Balance {
        uint totalBalance;
        uint numOfDeposits;
        mapping(uint => Transaction) deposits;
        uint numOfWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;

    function depositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numOfDeposits] = deposit;
        balances[msg.sender].numOfDeposits++;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        balances[msg.sender].totalBalance -= _amount;
        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numOfWithdrawals] = withdrawal;
        balances[msg.sender].numOfWithdrawals++;

        _to.transfer(_amount);
    }
}