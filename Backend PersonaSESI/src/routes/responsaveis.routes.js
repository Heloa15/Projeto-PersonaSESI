const express = require("express");
const router = express.Router();

const {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
} = require("../controller/responsaveis.controller");

router.post("/cadastrar", cadastrar);
router.get("/listar", listar);
router.get("/buscar/:cpf", buscar);
router.put("/atualizar/:cpf", atualizar);
router.delete("/excluir/:cpf", excluir);

module.exports = router;