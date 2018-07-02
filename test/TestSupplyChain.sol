pragma solidity ^0.4.13;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {
  SupplyChain chain = SupplyChain(DeployedAddresses.SupplyChain());

  /* uint numberOfElements = dummyContract.getNumberOfElements(); */
  /* Assert.equal(numberOfElements, 0, "Number of elements should be 0"); */
  /* MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin()); */
  /* Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");  } */

  // TO DO - Break out into helper functions

  function testBuyItemWithInsufficientFunds() public {
    // test for failure if user does not send enough funds
    chain.addItem("test", 1 ether);

    /* chain.buyItem(address(chain), 1); */

    // asser that it fails
    /* Asssert.isFalse(result, false, ''); */
    /* Assert.equal(mycontract.mynumber(), expected, "First number set should be 24."); */

  }

  // test for purchasing an item that is not for Sale
  function testNonPurchasableItem() {

  }

  function testShipItem() {
    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

  }

  function testReceiveItem() {
    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

  }
}
