pragma solidity ^0.7.0;

import "./AccessControl.sol";
import "./SafeERC20.sol";
import "./SafeMath.sol";

contract civiDAO is AccessControl {

using SafeMath for uint256;

//----------RBAC-------------------

bytes32 public constant _ADMIN = keccak256("_ADMIN");

}