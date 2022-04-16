# Introducing Ethereum and Solidity

This is an initial project created from scratch to begin learning about how to develop Ethereum smart contracts using Solidity.

## Development Environment

| Tool                | Description                                                                                                                             |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| Ganache             | Provides a local blockchain to deploy the contract to                                                                                   |
| Microsoft VSCode    | Excellent integrated development environment                                                                                            |
| solidity extension  | The de-facto solidity plugin for VSCode                                                                                                 |
| Truffle Suite       | A command-line suite of tools that provide compilation, testing and deploying smart contracts to development and production blockchains |
| Infura (optional)   | For deploying a contract to test networks like ropsten                                                                                  |
| Metamask (optional) | Web browser extension to manage wallets                                                                                                 |

## Design

The design is simple, as the intent of the project is to gain experience deeveloping a solidity app from scratch.

| ID  | Step                  | Description                                                                                                                         |
| --- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Create participant(s) | Assigns new participants their own internal ID. A participant can be a supplier or a consumer.                                      |
| 2   | Create product(s)     | These are the items that will be assigned to participants. A supplier makes a product and a consumer then purchases/owns a product. |
| 3   | Assign ownership      | Once participants and products are created they can be assigned                                                                     |

There are also test created in the tests.js file, which I would run to validate functionality and identify problems.

## Testing (Compilation and Deployment)

Once set up, the following are the steps I took to test changes. Using the VS code terminal:

`truffle test`

This compiles the code then deploys it to Ganache, the tests the contract methods.

## Roadmap

This project will be updated over time to improve how a supply chain is emulated, working towards a more real world and practical application.
