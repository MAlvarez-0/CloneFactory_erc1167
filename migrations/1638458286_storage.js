const Storage = artifacts.require('Storage');
module.exports = function(_deployer) {
  _deployer.deploy(Storage);
};
