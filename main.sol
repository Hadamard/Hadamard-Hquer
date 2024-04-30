
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/MyToken.sol";
import "forge-std/console.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol";
import { Upgrades } from "openzeppelin-foundry-upgrades/Upgrades.sol";

contract MyTokenTest is Test {
    MyToken myToken;
    ERC1967Proxy proxy;
    address owner;
    address newOwner;

    // Set up the test environment before running tests
    function setUp() public {
        // Deploy the token implementation
        MyToken implementation = new MyToken();
        // Define the owner address
        owner = vm.addr(1);
        // Deploy the proxy and initialize the contract through the proxy
        proxy = new ERC1967Proxy(address(implementation), abi.encodeCall(implementation.initialize, owner));
        // Attach the MyToken interface to the deployed proxy
        myToken = MyToken(address(proxy));
        // Define a new owner address for upgrade tests
        newOwner = address(1);
        // Emit the owner address for debugging purposes
        emit log_address(owner);
    }

    // Test the basic ERC20 functionality of the MyToken contract
    function testERC20Functionality() public {
        // Impersonate the owner to call mint function
        vm.prank(owner);
        // Mint tokens to address(2) and assert the balance
        myToken.mint(address(2), 1000);
        assertEq(myToken.balanceOf(address(2)), 1000);
    }

    // Test the upgradeability of the MyToken contract
    function testUpgradeability() public {
        // Upgrade the proxy to a new version; MyTokenV2
        Upgrades.upgradeProxy(address(proxy), "MyTokenV2.sol:MyTokenV2", "", owner);
    }
}






contract MultiSigToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;



    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    address[] public owners;
    uint public numRequiredSignatures;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event MultiSigTransfer(address indexed from, address indexed to, uint256 value, address[] signers);

    modifier onlyOwner() {
        require(isOwner(msg.sender), "Sender is not an owner");
        _;
    }

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply,
        address[] memory _initialOwners,
        uint _numRequiredSignatures
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        owners = _initialOwners;
        numRequiredSignatures = _numRequiredSignatures;
    }

    function isOwner(address _address) public view returns (bool) {
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == _address) {
                return true;
            }
        }
        return false;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value <= balanceOf[msg.sender], "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_value <= balanceOf[_from], "Insufficient balance");
        require(_value <= allowance[_from][msg.sender], "Insufficient allowance");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function multiSigTransfer(address _to, uint256 _value, address[] memory _signers) public onlyOwner returns (bool) {
        require(_signers.length >= numRequiredSignatures, "Insufficient signers");
        uint256 totalBalance = 0;
        for (uint i = 0; i < _signers.length; i++) {
            require(isOwner(_signers[i]), "Invalid signer");
            totalBalance += balanceOf[_signers[i]];
        }
        require(totalBalance >= _value, "Insufficient total balance");
        for (uint i = 0; i < _signers.length; i++) {
            balanceOf[_signers[i]] -= _value;
        }
        balanceOf[_to] += _value;
        emit MultiSigTransfer(msg.sender, _to, _value, _signers);
        return true;
    }
}
