pragma solidity ^0.4.13;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

  function beforeEach() {
    SupplyChain chain = SupplyChain(DeployedAddresses.SupplyChain());
  }

  /* uint numberOfElements = dummyContract.getNumberOfElements(); */
  /* Assert.equal(numberOfElements, 0, "Number of elements should be 0"); */

  /* MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin()); */
  /* Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");  } */

  // Test for failing conditions in this contracts
  // test that every modifier is working

  testBuyItem() {
    // test for failure if user does not send enough funds
    // test for purchasing an item that is not for Sale

  }

  test testShipItem() {
    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

  }

  testReceiveItem() {
    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

  }
}
