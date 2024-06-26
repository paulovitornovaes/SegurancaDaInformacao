rodar ganache em um terminal
copiar uma account, ex: 0xE956F21e86F85A88bEF240c4062908b336d329d2
rodar truffle migrate
rodar truffle console

const CertificadoContract = await CertificadoContract.deployed();
const accounts = await web3.eth.getAccounts();
const participant = accounts[1];
const nomeEvento = "Workshop Blockchain";
const horasComplementares = "8";
const nomeParticipante = "Alice";
await CertificadoContract.gerarCertificado(participant, nomeEvento, horasComplementares, nomeParticipante);
const certificado = await CertificadoContract.getCertificado(participant,0);
console.log("Detalhes do Certificado:", certificado);
