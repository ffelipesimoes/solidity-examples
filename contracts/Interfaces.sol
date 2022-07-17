// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// @title Interfaces
/// @notice When you don't have acess to other code contract or you don't want copy the full code, you can use interfaces.
/// @dev To do it, you need deploy a interface "function". This interface use the same functions as the original code. But only the function's header.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Interfaces
/// @notice Quando você não tem acesso a outro código do contrato ou não deseja copiar o código completo, você pode usar interfaces.
/// @dev Para fazer isso, você precisa implantar uma "função" de interface. Esta interface usa as mesmas funções que o código original. Mas apenas o cabeçalho da função.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract Counter {
    uint public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}

interface ICounter {
    function count() external view returns (uint);

    function inc() external;
}

contract CallInterface {
    uint public count;

    function usingInterfaces(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}
