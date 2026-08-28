const express = require("express");
const router = express.Router();

const {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
} = require("../controller/coordenadores.controller");

router.post("/cadastrar", cadastrar);
router.get("/listar", listar);
router.get("/buscar/:email", buscar);
router.put("/atualizar/:email", atualizar);
router.delete("/excluir/:email", excluir);

module.exports = router;