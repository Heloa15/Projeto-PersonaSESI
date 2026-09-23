const express = require("express");
const router = express.Router();

const validaLogin = require("../middleware/validaLogin");

const {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
} = require("../controller/professores.controller");

router.post("/cadastrar", cadastrar);
router.get("/listar", validaLogin("COORDENADOR"), listar);
router.get("/buscar/:email", validaLogin("PROFESSOR", "COORDENADOR"), buscar);
router.put("/atualizar/:email", validaLogin("COORDENADOR"), atualizar);
router.delete("/excluir/:email", validaLogin("COORDENADOR"), excluir);

module.exports = router;