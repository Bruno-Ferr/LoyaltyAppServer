pragma solidity ^0.8.12;

contract Loyalty {
    // Mapping of addresses to their loyalty points
    mapping(address => uint256) public users;

    // Event for adding points to a user's account
    event PointsAdded(address user, uint256 points);

    // Event for redeeming rewards
    event RewardRedeemed(address user, uint256 reward);

    // Function to add points to a user's account
    function addPoints(address user, uint256 _points) public {
        users[user] += _points;
        emit PointsAdded(user, _points);
    }

    // Function to redeem points for rewards
    function redeemReward(uint256 _points) public {
        // Check if the user has enough points to redeem the reward
        address user = msg.sender;
        require(users[user] >= _points, "Not enough points to redeem reward");

        // Deduct the reward points from the user's account
        users[user] -= _points;

        // Emit the reward redeemed event
        emit RewardRedeemed(user, _points);
    }
}