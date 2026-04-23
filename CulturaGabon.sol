// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaGabon
 * @dev Registro de extraccion de lipidos y tecnicas de coccion por vapor interno.
 * Serie: Sabores de Africa (42/54)
 */
contract CulturaGabon {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 densidadPulpa;      // Concentracion de grasa de palma natural (1-10)
        uint256 aislamientoTermico; // Eficiencia de la coccion en hoja (1-10)
        bool usaCarneAhumada;       // Metodo de conservacion previo a la coccion
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Poulet Nyembwe (Ingenieria de la Pulpa)
        registrarPlato(
            "Poulet Nyembwe", 
            "Pollo, nueces de palma fresca, cebolla, ajo, chile.",
            "Extraccion de la pulpa de palma mediante ebullicion y triturado manual; reduccion de la salsa hasta lograr alta viscosidad.",
            10, 
            3, 
            false
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _pulpa, 
        uint256 _aislamiento,
        bool _ahumado
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_pulpa <= 10, "Densidad fuera de rango");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            densidadPulpa: _pulpa,
            aislamientoTermico: _aislamiento,
            usaCarneAhumada: _ahumado,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
