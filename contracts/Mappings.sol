// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/// @title Mappings samples
/// @notice Mappings looks like a dictionary. Also looks with a json file with a sentence : value
/// @dev You can use this contract to get examples how to use mappings.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Exemplos de mappings
/// @notice Mappings parecem dicionarios. Ou também um arquivo json com uma sentença : valor
/// @dev Você pode usar este contrato para obter exemplos de como usar mapeamentos.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function simpleMapping() external {
        balances[msg.sender] = 123;

        balances[msg.sender] += 456; // 123 + 456 = 579

        delete balances[msg.sender]; // = 0
    }

    function set(address _key, uint _val) external {
        balances[_key] = _val;

        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {
        return balances[keys[0]];
    }

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }
}
