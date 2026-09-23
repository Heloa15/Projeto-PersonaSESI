const express = require("express");
const router = express.Router();

const validaLogin = require("../middleware/validaLogin");

const {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
} = require("../controller/responsaveis.controller");

router.post("/cadastrar", cadastrar);
router.get("/listar", validaLogin("COORDENADOR"), listar);
router.get("/buscar/:cpf", validaLogin("RESPONSAVEL", "COORDENADOR"), buscar);
router.put("/atualizar/:cpf", validaLogin("COORDENADOR"), atualizar);
router.delete("/excluir/:cpf", validaLogin("COORDENADOR"), excluir);

module.exports = router;