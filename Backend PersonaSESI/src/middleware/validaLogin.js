const validaLogin = (req, res, next) => {
    const login = req.headers["user"];

    if (login === "COORDENADOR" || login === "PROFESSOR") {
        next();
    } else {
        res.status(401).send("Sem nível de acesso");
    }
};