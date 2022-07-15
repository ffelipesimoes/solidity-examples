// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// @title Inherances
/// @notice You can inherance functions from others contracts using inherances.
/// @dev To do it, you need set a parent function as VIRTUAL and at child function you need OVERRIDE the function.
/// In case of multiple inherance, the order of inherance changes the final result.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Heranças
/// @notice Você pode herdar funções de outros contratos usando heranças.
/// @dev Para isso, é preciso setar a função pai como VIRTUAL, e a filho com o OVERRIDE.
/// Em caso de múltiplas heranças, a ordem da herança altera o resultado final.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    function bar() public pure override returns (string memory) {
        return "C";
    }
}
