// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// @title Calling others contracts
/// @notice You can call others contracts setting the address of the other contract and instantiate using a function.
/// @dev To do it, you need deploy the other contract and use this contract address to use those functions.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Chamando outros contratos
/// @notice Você pode chamar outros contratos setando o endereço do contrato para usar suar funções
/// @dev Para isso, é preciso executar o contrato principal e usar o adress dele para usar suas funções.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract CallTestContract {
    //You can use also setX(address _test, uint _x)...
    function setX(TestContract _test, uint _x) external {
        _test.setX(_x);
    }

    function getX(address _test) external view returns (uint x) {
        x = TestContract(_test).getX();
    }

    function setXAndSendEther(address _test, uint _x) external payable {
        TestContract(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test)
        external
        view
        returns (uint x, uint value)
    {
        (x, value) = TestContract(_test).getXandValue();
    }
}

contract TestContract {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }
}
