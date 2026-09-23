const jwt = require("jsonwebtoken");

const validaLogin = (...perfisPermitidos) => {
    return (req, res, next) => {
        const autorizacao = req.headers.authorization;

        if (!autorizacao) {
            return res.status(401).send("Token não informado");
        }

        const partes = autorizacao.split(" ");

        if (partes.length !== 2 || partes[0] !== "Bearer") {
            return res.status(401).send("Token inválido");
        }

        const token = partes[1];

        try {
            const usuario = jwt.verify(token, process.env.JWT_SECRET);

            if (!perfisPermitidos.includes(usuario.perfil)) {
                return res.status(403).send("Sem nível de acesso");
            }

            req.usuario = usuario;

            next();
        } catch (error) {
            return res.status(401).send("Token inválido ou expirado");
        }
    };
};

module.exports = validaLogin;

// const validaLogin = (...perfisPermitidos) => {
//     return (req, res, next) => {
//         next();
//     };
// };

// module.exports = validaLogin;