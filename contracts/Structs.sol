// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/// @title Structs samples
/// @notice Structs looks like a object. This object has attributes. Below you can see a object CAR. This CAR, has a model, year and owner.
/// @dev You can use this contract to get examples how to use structs.
/// All function calls are currently implemented without side effects.

//[PT-BR]
/// @title Exemplos de Structs
/// @notice Structs parecem com objetos. Objeto que tem atributos. Abaixo, perceba o objeto Carro. Esse carro tem: modelo, ano de fabricação e dono.
/// @dev Você pode usar este contrato para obter exemplos de como usar structs.
/// Todas as chamadas de função são atualmente implementadas sem efeitos colaterais.

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory ferrari = Car("Spider", 2022, msg.sender);
        Car memory tesla;
        tesla.model = "X";
        tesla.year = 2023;
        tesla.owner = msg.sender;

        cars.push(ferrari);
        carsByOwner[msg.sender].push(ferrari);

        cars.push(tesla);

        cars.push(Car("Mclaren", 2022, msg.sender));

        Car storage _car = cars[2];
        _car.year = 2022;
        delete _car.owner;
        delete cars[0];
    }

    function getAllCars() public view returns (Car[] memory) {
        return cars;
    }

    function addCarToCollection(uint _year, string memory _model) public {
        Car memory _car;
        _car = Car({year: _year, model: _model, owner: msg.sender});
        carsByOwner[msg.sender].push(_car);
    }
}
