const express = require("express");
const router = express.Router();

const validaLogin = require("../middleware/validaLogin");

const {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
} = require("../controller/alunos.controller");

router.post("/cadastrar", validaLogin("COORDENADOR"), cadastrar);
router.get("/listar", validaLogin("COORDENADOR", "PROFESSOR"), listar);
router.get("/buscar/:email", validaLogin("ALUNO", "PROFESSOR", "COORDENADOR", "RESPONSAVEL"), buscar);
router.put("/atualizar/:email", validaLogin("COORDENADOR"), atualizar);
router.delete("/excluir/:email", validaLogin("COORDENADOR"), excluir);

module.exports = router;