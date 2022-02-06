pragma solidity >=0.7.0 <0.9.0;

contract Exercise1 {
    address owner;
    mapping(address => uint256) private balances;
    uint256 private _totalSupply;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    function transfer(address _toAccount, uint256 amount) public payable {
        uint256 currentBalance = balances[msg.sender];
        require(currentBalance >= amount, "Out of token to send!!!");

        unchecked {
            balances[msg.sender] -= amount;
        }
        balances[_toAccount] += amount;
    }

    function mint(address _receiper, uint256 amount) public payable onlyOwner {
        _totalSupply += amount;
        balances[_receiper] += amount;
    }
}
