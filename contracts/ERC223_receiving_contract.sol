pragma solidity ^0.4.11;

 /**
 * @title Contract that will work with ERC223 tokens.
 */

 import "./Receiver_Interface.sol"
 
contract ERC223ReceivingContract is Receiver_Interface { 
/**
 * @dev Standard ERC223 function that will handle incoming token transfers.
 *
 * @param _from  Token sender address.
 * @param _value Amount of tokens.
 * @param _data  Transaction metadata.
 */
    function tokenFallback(address _from, uint _value, bytes _data);
}
