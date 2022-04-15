const HDWalletProvider = require("@truffle/hdwallet-provider");
var mnemonic = "YOUR MNEMONIC FROM YOUR WALLET (MetaMask)";

module.exports = {
  networks: {
   development: {
    host: "127.0.0.1",
    port: 7545,
    network_id: "*"
   }
  }
 };
