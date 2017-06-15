pragma solidity ^0.4.11;
import './ERC20.sol';

contract Base {

    address private manager;
    address private investor;
    address private allowedToken;

    address public eth_coinbase;

    address public alt_coinbase;

    ERC20 public token;

    function Base(
    address _manager,
    address _allowedToken
    ) {
        investor = msg.sender;
        manager = _manager;
        allowedToken = _allowedToken;

    }

    modifier onlyManager() {
        require(msg.sender == manager);
        _;
    }

    function trade(address _token, uint256 amount) onlyManager {
        if(_token == allowedToken) {
            token = ERC20(_token);
            token.transfer(alt_coinbase, amount);
            msg.sender.transfer(amount);
        }
    }

    function () payable {

    }
}

