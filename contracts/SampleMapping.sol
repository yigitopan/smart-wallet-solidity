//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract SampleMapping {

   mapping(uint => bool) public myMapping;
   mapping(address => bool) public myAddressMapping;


   function setValue(uint _index) public {
    myMapping[_index] = true;
   }

    function setAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}