// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

contract SupplyChain {
    address public owner = msg.sender;
    uint32 public g_participant_id = 0;
    uint32 public g_product_id = 0;
    uint32 public g_event_id = 0;

    uint256 NULL_NUMBER = 0;
    uint32 UPPER_BOUNDS = 10;

    // === participants ===
    struct participant {
        uint32 participantID;
        string userName;
        string participantType;
        address participantAddress;
    }

    mapping(uint32 => participant) public participants;

    // --- participant functions ---
    function addParticipant(
        string memory _name,
        string memory _pType,
        address _pAddress
    ) public returns (uint256) {
        {
            g_participant_id++;
            participants[g_participant_id].participantID = g_participant_id;
            participants[g_participant_id].userName = _name;
            participants[g_participant_id].participantAddress = _pAddress;
            participants[g_participant_id].participantType = _pType;

            return g_participant_id;
        }
    }

    function getParticipant(address _address) public view returns (uint32) {
        for (uint32 i = 0; i < UPPER_BOUNDS; i++) {
            if (
                keccak256(
                    abi.encodePacked(participants[i].participantAddress)
                ) == keccak256(abi.encodePacked(_address))
            ) {
                return participants[i].participantID;
            }
        }
        return 0;
    }

    // === products ===
    struct product {
        uint32 productID;
        string uniqueID;
        string productName;
    }

    mapping(uint32 => product) public products;

    // --- product functions ---
    function addProduct(string memory _uniqueID, string memory _productName)
        public
        returns (uint256)
    {
        {
            g_product_id++;
            products[g_product_id].productID = g_product_id;
            products[g_product_id].uniqueID = _uniqueID;
            products[g_product_id].productName = _productName;

            return g_product_id;
        }
    }

    function getProduct(string memory _unique_id) public view returns (uint32) {
        for (uint32 i = 0; i < UPPER_BOUNDS; i++) {
            if (
                keccak256(abi.encodePacked(products[i].uniqueID)) ==
                keccak256(abi.encodePacked(_unique_id))
            ) {
                return products[i].productID;
            }
        }
        return 0;
    }

    // === events ==
    struct SCeventStruct {
        uint32 eventID;
        uint32 participantID;
        uint32 productID;
        string eventDescription;
        uint32 eventTimestamp;
    }

    mapping(uint32 => SCeventStruct) public events;
    event OwnershipEvent(uint32 productId);

    function addEvent(uint32 _participant_id, uint32 _product_id)
        public
        returns (uint256)
    {
        {
            g_event_id++;
            events[g_event_id].participantID = _participant_id;
            events[g_event_id].productID = _product_id;
            events[g_event_id].eventDescription = "Add";
            events[g_event_id].eventTimestamp = uint32(block.timestamp);
            emit OwnershipEvent(_product_id);
            return g_event_id;
        }
    }

    function getEvent(uint32 _event_id)
        public
        view
        returns (string memory eventDescription, uint32 eventTimestamp)
    {
        return (
            events[_event_id].eventDescription,
            events[_event_id].eventTimestamp
        );
    }
}
