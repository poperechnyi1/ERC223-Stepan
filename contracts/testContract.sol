pragma solidity ^0.4.15;

import './Receiver_Interface.sol';


contract TestContract {
    
    function at(address _addr) private  returns (bytes o_code) {
        assembly {
            // retrieve the size of the code, this needs assembly
            let size := extcodesize(_addr)
            // allocate output byte array - this could also be done without assembly
            // by using o_code = new bytes(size)
            o_code := mload(0x40)
            // new "memory end" including padding
            mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            // store length in memory
            mstore(o_code, size)
            // actually retrieve the code, this needs assembly
            extcodecopy(_addr, add(o_code, 0x20), 0, size)
        }
    }


    function getByteCode (address _contract) constant returns (bytes) {
        return at(_contract);
    }

    // function toBytes(uint256 x) returns (bytes b) {
    //     b = new bytes(32);
    //     assembly { mstore(add(b, 32), x) }
    // }

    function compare(address _to) constant returns(bool){
        uint codeLength;

        assembly {
            // Retrieve the size of the code on target address, this needs assembly .
            codeLength := extcodesize(_to)
        }

        if(codeLength > 0)
        {
            return true;
        } else {
            return false;
        }

    }

    function callFunctionExternalContract(address _from, uint256 _value, bytes _data) constant returns(bytes){
        // testContract instance =  testContract(_from);
        ContractReceiver instance = ContractReceiver(_from);
        instance.tokenFallback(msg.sender, _value, _data);
    }

    
}