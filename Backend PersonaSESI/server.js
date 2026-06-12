const express = require("express");
const cors = require("cors");
require("dotenv").config();

const alunosRoutes = require("./src/routes/alunos.routes");
const atividadesRoutes = require("./src/routes/atividades.routes");
const coordenadoresRoutes = require("./src/routes/coordenadores.routes");
const professoresRoutes = require("./src/routes/professores.routes");
const responsaveisRoutes = require("./src/routes/responsaveis.routes");

const app = express();

app.use(express.json());
app.use(cors());

app.use("/alunos", alunosRoutes);
app.use("/atividades", atividadesRoutes);
app.use("/coordenadores", coordenadoresRoutes);
app.use("/professores", professoresRoutes);
app.use("/responsaveis", responsaveisRoutes);

app.listen(3000, () => {
    console.log("Servidor Online!");
});