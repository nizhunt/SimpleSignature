const ethers = require("ethers");
const readlineSync = require("readline-sync");
require("dotenv").config();

const passcode = readlineSync.question("Passcode: ");
const secretMessage = readlineSync.question("Secret Message: ");
const message = ethers.utils.solidityKeccak256(
  ["uint256", "string"],
  [passcode, secretMessage]
);
const arrayifyMessage = ethers.utils.arrayify(message);
const flatSignature = new ethers.Wallet(process.env.PRIVATE_KEY).signMessage(
  arrayifyMessage
);
console.log("SIGNATURE:", flatSignature);
