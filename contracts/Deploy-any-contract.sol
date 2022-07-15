// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// @title Deploy contracts by proxy
/// @notice This functions alows use a intermediate contract(or proxy) to instantiate a new smartcontract.
/// @dev You can use this contract to instantiate new contracts. Through the helper contract you can get the bytecode of TestContract1/2 to deploy those contracts.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Criando contratos via proxy
/// @notice Essa função permite usar um contrato intermediário ou proxy para criar um novo contrato.
/// @dev Você pode usar este contrato para criar novos contratos. Através do contrato Helper, você pode pegar o bytecode dos contratos TestContract1/2 para executá-los.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "not owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address);

    function deploy(bytes memory _code)
        external
        payable
        returns (address addr)
    {
        assembly {
            // create(v,p,n)
            // v = amount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "deploy failed");

        emit Deploy(addr);
    }

    function execute(address _target, bytes memory _data) external payable {
        (bool sucess, ) = _target.call{value: msg.value}(_data);
        require(sucess, "failed");
    }
}

contract Helper {
    function getBytecodeContract1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getBytecodeContract2(uint _x, uint _y)
        external
        pure
        returns (bytes memory)
    {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}
