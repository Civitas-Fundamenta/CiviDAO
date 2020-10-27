pragma solidity ^0.7.0;

import "./AccessControl.sol";
import "./SafeERC20.sol";
import "./SafeMath.sol";

contract civiDAO is AccessControl {

using SafeMath for uint256;

IERC20 private fundamenta;

//----------RBAC-------------------

bytes32 public constant _ADMIN = keccak256("_ADMIN");

//------Set Token Address----------

function setAddress(IERC20 _token) public {
    require(hasRole(_ADMIN, msg.sender));
    fundamenta = _token;
}

}