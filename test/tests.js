var SupplyChain = artifacts.require('./SupplyChain.sol');

contract('SupplyChain', async accounts => {
    var supplierAddress = "0xc72659350bB7A2a94C7bFcd5C3b7Cf2710dcdF3E";
    var consumerAddress = "0xf3Cc1522bBc1dd255F7a29a96B3cdfC9dEA3C8e4";
    var product1 = "0xABC123";
    var product2 = "0xDEF456";
    
    // test 1
    it("should get a supplier address", async () => {
        let instance = await SupplyChain.deployed();
        let tempParticipantID = await instance.addParticipant("John Doe", "Supplier", supplierAddress);
        let participantID = await instance.getParticipant(supplierAddress);
        assert.equal(participantID, 1, "Incorrect Supplier ID");
    }),
    it("should get a supplier address", async () => {
        let instance = await SupplyChain.deployed();
        let tempParticipantID = await instance.addParticipant("Rebecca Smith", "Consumer", consumerAddress);
        let participantID = await instance.getParticipant(consumerAddress);
        assert.equal(participantID, 2, "Incorrect Consumer ID");
    }),
    it("should get a product id", async () => {
        let instance = await SupplyChain.deployed();
        let tempProductID = await instance.addProduct(product1, "Bananas");
        let productID = await instance.getProduct(product1);
        assert.equal(productID, 1, "Incorrect Product ID");
    }),
    it("should get a product id", async () => {
        let instance = await SupplyChain.deployed();
        let tempProductID = await instance.addProduct(product2, "Apples");
        let productID = await instance.getProduct(product2);
        assert.equal(productID, 2, "Incorrect Product ID");
    })
    ,
    it("should get a event desc Add", async () => {
        let instance = await SupplyChain.deployed();
        let tempEventID = await instance.addEvent(1,1);
        let eventStruct = await instance.getEvent(1);
        assert.equal(eventStruct[0], "Add", "Incorrect Event ID");
    })
});