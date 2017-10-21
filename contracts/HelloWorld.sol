pragma solidity ^0.4.17;

contract HelloWorld {
    
    string word = "Hello World";
    address issuer;
    
    function HelloWorld() {
        issuer = msg.sender;
    }
    
    modifier ifIssuer() { //setWord needs to check this modifier first before running
        if (issuer != msg.sender) {
            throw;
        } else {
            _; //continue with execution of setWord
        }
        
    }
    
    function getWord() view returns (string) {
        return word;
    }
    
    function setWord(string _newWord) ifIssuer returns (string) {
        word = _newWord;
        return "this is the creator";
    }
}