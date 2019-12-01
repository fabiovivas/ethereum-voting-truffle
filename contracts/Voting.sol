pragma solidity ^0.5.13;

contract Voting {
        
    bytes32[] public candidateList;
    mapping(bytes32 => int8) public votesReceived;
    constructor(bytes32[] memory candidateNames) public {
        candidateList = candidateNames;
    }
    
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }
    
    function totalVotesFor(bytes32 candidate) public view returns(int8) {
        require(validCandidate(candidate));
        int8 count = votesReceived[candidate];
        return count;
    }
    
    function validCandidate(bytes32 candidate) public view returns(bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if(candidateList[i] == candidate) return true;
        }
        return false;
    }
}