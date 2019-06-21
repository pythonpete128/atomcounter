// contracts/CounterApp.sol
pragma solidity 0.4.24;
import "@aragon/os/contracts/apps/AragonApp.sol";

contract CounterApp is AragonApp{
    // ...
    bytes32 constant public INCREMENT_ROLE = keccak256("INCREMENT_ROLE");
    bytes32 constant public DECREMENT_ROLE = keccak256("DECREMENT_ROLE");
    // ...

    function initialize() onlyInit public {
        initialized();
    }

    // Events
    event Increment(address entity);
    event Decrement(address entity);

    // State
    int public value;
    /**
   * @notice Increment the counter by 1
   */
    function increment() external {
        value += 1;
        emit Increment(msg.sender);
    }
    /**
     * @notice Decrement the counter by 1
     */
    function decrement() external {
        value -= 1;
        emit Decrement(msg.sender);
    }
}
