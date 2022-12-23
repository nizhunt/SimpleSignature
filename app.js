const ethers = require("ethers");
const readlineSync = require("readline-sync");
require("dotenv").config();

const main = async () => {
  const room = readlineSync.question("Room No: ");

  /* Code to check if the requested room is available */

  const message = ethers.utils.solidityKeccak256(["uint256"], [room]);
  const arrayifyMessage = ethers.utils.arrayify(message);
  const flatSignature = await new ethers.Wallet(
    process.env.PRIVATE_KEY
  ).signMessage(arrayifyMessage);
  console.log("SIGNATURE:", flatSignature);
};

main();
