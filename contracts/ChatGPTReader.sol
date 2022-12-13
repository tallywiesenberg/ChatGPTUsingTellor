pragma solidity >=0.8.0;

import "usingtellor/contracts/UsingTellor.sol";

contract ChatGPTReader is UsingTellor {

  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) {}

  function readChatGPTResponse(string memory _question) external view returns(string memory) {
    
      bytes memory _queryData = abi.encode("ChatGPTResponse", abi.encode(_question));
      bytes32 _queryId = keccak256(_queryData);
      
      (bytes memory _value, uint256 _timestampRetrieved) =
          getDataBefore(_queryId, block.timestamp - 20 minutes);
      if (_timestampRetrieved == 0) return "";
      return abi.decode(_value, (string));
    }

}
