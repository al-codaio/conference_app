pragma solidity ^0.4.17;

contract Custodial {
    
    address client;
    bool public _switch = false;
    
    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address _user, uint _amount);
    
    function CustodialContract() {
        client = msg.sender;
    }
    
    modifier ifClient() {
        if (msg.sender != client) {
            revert();
        }
        _;
    }
    
    function depositFunds() payable {
        UserStatus('User has deposited money', msg.sender, msg.value);
    }
    
    function withdrawFunds(uint amount) ifClient {
        if (client.send(amount)) {
            UpdateStatus('User has transferred money');
            _switch = true;
        } else {
            _switch = false;
        }
    }
    
    function getFunds() ifClient view returns (uint) {
        return this.balance;
    }
     
    
}