// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificateContract {
    struct Certificate {
        string nomeEvento;
        string horasComplementares; 
        string nomeParticipante;
    }

    mapping(address => Certificate[]) public certificates;

    event CertificateIssued(address indexed participant, string nomeEvento, string horasComplementares, string nomeParticipante);

    function gerarCertificado(address _participant, string memory _nomeEvento, string memory _horasComplementares, string memory _nomeParticipante) public {
        certificates[_participant].push(Certificate({
            nomeEvento: _nomeEvento,
            horasComplementares: _horasComplementares,
            nomeParticipante: _nomeParticipante
        }));

        emit CertificateIssued(_participant, _nomeEvento, _horasComplementares, _nomeParticipante);
    }

    function getCertificado(address _participant, uint index) public view returns (string memory, string memory, string memory) {
        require(index < certificates[_participant].length, "Certificado nao encontrado");
        Certificate memory cert = certificates[_participant][index];
        return (cert.nomeEvento, cert.horasComplementares, cert.nomeParticipante);
    }

    function getNumberOfCertificates(address _participant) public view returns (uint) {
        return certificates[_participant].length;
    }
}
