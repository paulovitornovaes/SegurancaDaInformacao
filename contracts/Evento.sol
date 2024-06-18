// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificateContract {
    struct Certificate {
        string nomeEvento;
        uint horasComplementares;
        string nomeParticipante;
        bool exists;
    }

    mapping(address => Certificate) public certificates;

    event CertificateIssued(address indexed participant, string nomeEvento, uint horasComplementares, string nomeParticipante);

    function gerarCertificado(address _participant, string memory _nomeEvento, uint _horasComplementares, string memory _nomeParticipante) public {
        require(!certificates[_participant].exists, "Certificado ja existe para esse participante");

        certificates[_participant] = Certificate({
            nomeEvento: _nomeEvento,
            horasComplementares: _horasComplementares,
            nomeParticipante: _nomeParticipante,
            exists: true
        });

        emit CertificateIssued(_participant, _nomeEvento, _horasComplementares, _nomeParticipante);
    }

    function validarCertificado(address _participant) public view returns (bool) {
        return certificates[_participant].exists;
    }

    function getCertificado(address _participant) public view returns (string memory, uint, string memory, bool) {
        Certificate memory cert = certificates[_participant];
        return (cert.nomeEvento, cert.horasComplementares, cert.nomeParticipante, cert.exists);
    }
}
