pragma solidity ^0.4.23;

contract SupplyChain {
  address public owner;
  uint skuCount;

  mapping(uint => Item) public items;

  enum State {
    ForSale, Sold, Shipped, Received
  }

  struct Item {
    string name;
    uint sku;
    uint price;
    State state;
    address seller;
    address buyer;
  }

  event ForSale(uint sku);
  event Sold(uint sku);
  event Shipped(uint sku);
  event Received(uint sku);

  modifier verifyOwner (address _address) {
    require(owner == msg.sender); _;
  }
  modifier verifyCaller (address _address) { require (msg.sender == _address); _;}
  modifier paidEnough(uint _price) { require(msg.value >= _price); _;}
  modifier checkValue(uint _sku) {
    //refund them after pay for item (why it is before, _ checks for logic before func)
    _;
    uint _price = items[_sku].price;
    uint amountToRefund = msg.value - _price;
    items[_sku].buyer.transfer(amountToRefund);
  }
  modifier forSale(uint _sku) {
    require(items[_sku].state == State.ForSale);
    _;
  }
  modifier sold(uint _sku) {
    require(items[_sku].state == State.Sold);
    _;
  }
  modifier shipped(uint _sku) {
    require(items[_sku].state == State.Shipped);
    _;
  }
  modifier received(uint _sku) {
    require(items[_sku].state == State.Received);
    _;
  }

  constructor() public {
    owner = msg.sender;
    skuCount = 0;
  }

  function addItem(string _name, uint _price) public {
    emit ForSale(skuCount); // comment this back in
    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, state: State.ForSale, seller: msg.sender, buyer: 0});
    skuCount = skuCount + 1;
  }

  function buyItem(uint sku) public payable forSale(sku) paidEnough(msg.value) checkValue(sku){
    var seller = items[sku].seller;
    var itemCost = items[sku].price;
    seller.transfer(itemCost);

    items[sku].buyer = msg.sender;
    items[sku].state = State.Sold;

    emit Sold(sku);
  }

  /* Add 2 modifiers to check if the item is sold already, and that the person calling this function
  is the seller.

  Change the state of the item to shipped.
  */
  function shipItem(uint sku) public {

    emit Shipped(sku);
  }

  /*
    Add 2 modifiers to check if the item is shipped already, and that the person calling this function
    is the buyer.

    Change the state of the item to received.
  */
  function receiveItem(uint sku) public {

    emit Received(sku);
  }

  function fetchItem(uint _sku) public view returns (string name, uint sku, uint price, uint state, address seller, address buyer) {
    name = items[_sku].name;
    sku = items[_sku].sku;
    price = items[_sku].price;
    state = uint(items[_sku].state);
    seller = items[_sku].seller;
    buyer = items[_sku].buyer;
    return (name, sku, price, state, seller, buyer);
  }

}
