// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// @title Payable
/// @notice You can use this function to send ETH or some function or contract.
/// @dev To do it, you need set a payable parameter in a variable.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Payable
/// @notice Você pode usar essa função para enviar ETH para uma função ou contrato.
/// @dev Para isso, é preciso setar o parametro Payable na variável.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.
contract Payable {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
