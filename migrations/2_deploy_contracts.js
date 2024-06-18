// SPDX-License-Identifier: MIT
const CertificateContract = artifacts.require("CertificateContract");

module.exports = function(deployer) {
  deployer.deploy(CertificateContract);
};
