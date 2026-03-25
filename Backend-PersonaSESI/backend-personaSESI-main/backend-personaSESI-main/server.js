const express = require("express");
const cors = require("cors");

const alunosRoutes = require("./src/routes/alunos.routes");
const responsaveisRoutes = require("./src/routes/responsaveis.routes");
const professoresRoutes = require("./src/routes/professores.routes");
const coordenadoresRoutes = require("./src/routes/coordenadores.routes");
const atividadesRoutes = require("./src/routes/atividades.routes");

const app = express();

app.use(express.json());
app.use(cors());

app.use(alunosRoutes);
app.use(responsaveisRoutes);
app.use(professoresRoutes);
app.use(coordenadoresRoutes);
app.use(atividadesRoutes);

app.listen(3000, () => {
    console.log("Servidor Online!");
});