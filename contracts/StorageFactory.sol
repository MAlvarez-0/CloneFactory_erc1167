pragma solidity >=0.8.10 <0.9.0;

import "./Storage.sol";
import "./CloneFactory.sol";

contract StorageFactory is CloneFactory  {
    address public admin;
    address public implementation;
    address[] public clonedContracts;

    event ClonedContract(address _clonedContract);

    constructor(address _implementation){
        implementation = _implementation;
        admin = msg.sender;
    }
    
    function createStorage() public {
        //Create clone of Storage smart contract
        address clone = createClone(implementation);
        // Storage(clone).init(msg.sender); fonction pour initialiser le clone 
        emit ClonedContract(clone);
        clonedContracts.push(clone);
    }

    function getAddress(uint i) view external returns (address){
        return clonedContracts[i];
    }
}