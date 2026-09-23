const prisma = require("../data/prisma");
const jwt = require("jsonwebtoken");

const login = async (req, res) => {
    try {
        const { email, senha } = req.body;

        if (!email || !senha) {
            return res.status(400).send("E-mail e senha são obrigatórios");
        }

        let usuario = null;
        let perfil = null;

        const aluno = await prisma.alunos.findUnique({
            where: { email }
        });

        if (aluno) {
            usuario = aluno;
            perfil = "ALUNO";
        }

        if (!usuario) {
            const professor = await prisma.professores.findUnique({
                where: { email }
            });

            if (professor) {
                usuario = professor;
                perfil = "PROFESSOR";
            }
        }

        if (!usuario) {
            const coordenador = await prisma.coordenadores.findUnique({
                where: { email }
            });

            if (coordenador) {
                usuario = coordenador;
                perfil = "COORDENADOR";
            }
        }

        if (!usuario) {
            const responsavel = await prisma.responsaveis.findUnique({
                where: { email }
            });

            if (responsavel) {
                usuario = responsavel;
                perfil = "RESPONSAVEL";
            }
        }

        if (!usuario || usuario.senha !== senha) {
            return res.status(401).send("E-mail ou senha incorretos");
        }

        const token = jwt.sign(
            {
                id: usuario.id,
                email: usuario.email,
                perfil: perfil
            },
            process.env.JWT_SECRET,
            {
                expiresIn: "1h"
            }
        );

        return res.status(200).json({
            mensagem: "Login realizado com sucesso",
            token,
            usuario: {
                id: usuario.id,
                nome: usuario.nome,
                email: usuario.email,
                perfil
            }
        });
    } catch (error) {
        console.error(error);
        return res.status(500).send("Erro ao realizar login");
    }
};

module.exports = {
    login
};