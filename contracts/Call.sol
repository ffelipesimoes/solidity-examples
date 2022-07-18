// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// @title Call
/// @notice You can call others contracts setting the address of the other contract and instantiate using a function.
/// @dev To do it, you need deploy the other contract and use this contract address to use those functions.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Call
/// @notice Você pode chamar outros contratos setando o endereço do contrato para usar suar funções
/// @dev Para isso, é preciso executar o contrato principal e usar o adress dele para usar suas funções.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("Fallback was called");
    }

    function foo(string memory _message, uint _x)
        external
        payable
        returns (bool, uint)
    {
        message = _message;
        x = _x;
        return (true, 345);
    }
}

contract Call {
    bytes1 public data;

    function callFoo(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{
            value: msg.sender,
            gas: 50000
        }(abi.encodeWithSignature("foo(string,uint256)", "call foo", 234));
        require(sucess, "call failed");
        data = _data;
    }

    function callDoesExist(adress _test) external {
        (bool success, ) = _test.call(
            abi.encodeWithSignature("doesNotExist()")
        );
        require(sucess, "call failed");
    }
}
