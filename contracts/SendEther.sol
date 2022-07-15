// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// @title SendEth
/// @notice You can use these 3 functions to send ETH or some function or contract.
/// @dev To do it, it's recommended use the .call function.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Enviando Eth
/// @notice Você pode usar essas 3 funções para enviar ETH para enviar ETH para uma função ou contrato.
/// @dev Para isso, É recomendado usa a função .call.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(msg.value);
        require(sent, "send failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool sucess, ) = _to.call{value: msg.value}("");
        require(sucess, "call failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
