// SPDX-License-Identifier: MIT
const CertificadoContract = artifacts.require("CertificadoContract");

module.exports = function(deployer) {
  deployer.deploy(CertificadoContract);
};
