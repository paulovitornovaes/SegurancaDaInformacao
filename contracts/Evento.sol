// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificadoContract {
    struct Certificado {
        string nomeEvento;
        string horasComplementares; 
        string nomeParticipante;
    }

    mapping(address => Certificado[]) public certificados;

    event CertificateIssued(address indexed participant, string nomeEvento, string horasComplementares, string nomeParticipante);

    function gerarCertificado(address _participant, string memory _nomeEvento, string memory _horasComplementares, string memory _nomeParticipante) public {
        certificados[_participant].push(Certificado({
            nomeEvento: _nomeEvento,
            horasComplementares: _horasComplementares,
            nomeParticipante: _nomeParticipante
        }));

        emit CertificateIssued(_participant, _nomeEvento, _horasComplementares, _nomeParticipante);
    }

    function getCertificado(address _participant, uint index) public view returns (string memory, string memory, string memory) {
        require(index < certificados[_participant].length, "Certificado nao encontrado");
        Certificado memory cert = certificados[_participant][index];
        return (cert.nomeEvento, cert.horasComplementares, cert.nomeParticipante);
    }

    function getNumberOfCertificados(address _participant) public view returns (uint) {
        return certificados[_participant].length;
    }
}
