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

//Ability to get contracts to talk to each other

contract Caller {
    Called toBeCalled = Called(0xdf703a49284fe3f547cd1050d91db9436b53898e);
    
    function getNumber() view returns (uint) {
        return toBeCalled.getNumber();
    }
    
    function getWords() view returns (bytes32) {
        return toBeCalled.getWords();
    }
}

contract Called {
    uint number = 35;
    bytes32 words = "hello my name is bob.";
    
    function getNumber() view returns (uint) {
        return number;
    }
    
    function setNumber(uint _number) {
        number = _number;
    }
    
    function getWords() view returns (bytes32) {
        return words;
    }
}


contract ProofOfExistence1 {  
    bytes32 public proof;
  
    function notarize(string document) {
        proof = proofFor(document);
    }
  
    function proofFor(string document) view returns (bytes32) {
        return sha256(document);
    }
}

contract ProofOfExistence2 { 
    bytes32[] private proofs;

    function storeProof(bytes32 proof) {
        proofs.push(proof);
    }

    function notarize(string _document) {
        bytes32 proof = proofFor(_document);
        storeProof(proof);
    }

    function proofFor(string _document) view returns (bytes32) {
        return sha256(_document);
    }

    function checkDocument(string _document) view returns (bool) {
        bytes32 proof = proofFor(_document);
        return hasProof(proof);
    }

    function hasProof(bytes32 _proof) view returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofs[i] == _proof) {
                return true;
            } else {
                return false;
            }
        }
    }
}

contract ProofOfExistence3 { 
    mapping (bytes32 => bool) private proofs;

    function storeProof(bytes32 proof) {
        proofs[proof] = true;
    }

    function notarize(string _document) {
        bytes32 proof = proofFor(_document);
        storeProof(proof);
    }

    function proofFor(string _document) view returns (bytes32) {
        return sha256(_document);
    }

    function checkDocument(string _document) view returns (bool) {
        bytes32 proof = proofFor(_document);
        return hasProof(proof);
    }

    function hasProof(bytes32 _proof) view returns (bool) {
        return proofs[_proof];
    }
}
