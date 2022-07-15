// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint[] calldata y, string calldata s)
        external
        returns (uint[] memory)
    {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        _internal(y);

        uint[] memory memArr = new uint[](3);
        memArr[0] = 123;
        return memArr;
    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}
