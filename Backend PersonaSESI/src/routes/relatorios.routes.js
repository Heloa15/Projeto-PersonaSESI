const express = require("express");

const router = express.Router();

const {

    calcularEstatisticas,
    estatisticasAluno,
    relatorioAluno,
    relatorioProfessor,
    relatorioCoordenador

} = require("../controller/relatorios.controllers");
const validaLogin = require("../middleware/validaLogin");

router.get("/estatisticas", calcularEstatisticas);
router.get("/aluno", estatisticasAluno);
router.get("/aluno/relatorio/:id", relatorioAluno);
router.get("/professor/relatorio/:id", relatorioProfessor);
router.get("/coordenador/relatorio/:id", relatorioCoordenador);

module.exports = router;