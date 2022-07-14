// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Enum {
    enum ProductState {
        New,
        Used
    }

    enum DeliveryStatus {
        Sent,
        Finished,
        Canceled
    }

    struct Product {
        uint price;
        string name;
        ProductState productState;
    }

    struct Order {
        address buyer;
        DeliveryStatus deliveryStatus;
        Product product;
    }

    Order[] public orders;
    Product[] public products;

    function addProduct(uint _price, string memory _name) external {
        products.push(Product(_price, _name, ProductState.New));
    }

    function addOrder(Product memory _product) external {
        orders.push(Order(msg.sender, DeliveryStatus.Sent, _product));
    }
}
