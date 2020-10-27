pragma solidity ^0.7.0;

import "./AccessControl.sol";
import "./SafeERC20.sol";
import "./SafeMath.sol";

contract civiDAO is AccessControl {

    using SafeMath for uint256;

    IERC20 private fundamenta;

    //----------RBAC-------------------

    bytes32 public constant _ADMIN = keccak256("_ADMIN");
    bytes32 public constant WEBSITE = keccak256("fundamenta.network"); // TEST STRING 

    struct Proposals {
        address Originator;
        bytes32 Website;
        uint BlockHeightProposed;
        uint AllocatedWeight;
        bool Active;
        uint ProposalID;
    }

    Proposals[] public proposalArray;

    //------Set Token Address-----------

    function setAddress(IERC20 _token) public {
        require(hasRole(_ADMIN, msg.sender));
        fundamenta = _token;
    }

    //-------DAO Fundtions--------------

    function addProposal(bytes32 _website) public {
        uint propid = propID().add(1);
        proposalArray.push(Proposals({
            Originator: msg.sender,
            Website: _website,
            BlockHeightProposed: block.number,
            AllocatedWeight: 0,
            Active: false,
            ProposalID: propid
        }));
    }

    function propID() public view returns (uint) {
        return proposalArray.length;
    }

}
