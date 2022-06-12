// SPDX-license-Identifier: MIT
pragma solidity ^0.8.3;

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];

    function workingWithArrays() external {
        // Push - Adicionar um item ao array
        nums.push(4); // [1,2,3,4]

        //Editar uma posição no array
        nums[2] = 777; //[1,2,777,4]

        //Deletar uma posição no array
        //Obs: O comando delete, zera a posição, não diminui o tamanho do array
        delete nums[1]; //[1,0,777,4]

        //Remove a última posição do array
        nums.pop(); //[1,0,777]

        //Cria um array na memoria
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }

    //Retornar um array à partir de uma função deve ser usada cuidadosamente. Quanto maior for o array, mais GAS vai consumir.
    //Return an array from a function should be used carefully. How much bigger is the array more gas it will cost. dgkndnfksndfksdnksd
    function returnArray() external view returns (uint[] memory) {
        return nums;
    }
}
