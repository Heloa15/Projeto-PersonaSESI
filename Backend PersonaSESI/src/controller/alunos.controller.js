const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    try {
        const item = await prisma.alunos.create({
            data: req.body
        });

        res.status(201).json(item);

    } catch (error) {
        res.status(500).json({ msg: "Erro ao cadastrar aluno" });
    }
};

const listar = async (req, res) => {
    try {

        const lista = await prisma.alunos.findMany();

        res.status(200).json(lista);

    } catch (error) {
        res.status(500).json({ msg: "Erro ao listar alunos" });
    }
};

const buscar = async (req, res) => {
    try {

        const { email } = req.params;

        const item = await prisma.alunos.findUnique({
            where: { email }
        });

        if (!item) {
            return res.status(404).json({
                msg: "Aluno não encontrado"
            });
        }

        res.status(200).json(item);

    } catch (error) {
        res.status(500).json({ msg: "Erro ao buscar aluno" });
    }
};

const atualizar = async (req, res) => {
    try {

        const { email } = req.params;

        const item = await prisma.alunos.update({
            where: { email },
            data: req.body
        });

        res.status(200).json(item);

    } catch (error) {
        res.status(500).json({ msg: "Erro ao atualizar aluno" });
    }
};

const excluir = async (req, res) => {
    try {

        const { email } = req.params;

        const item = await prisma.alunos.delete({
            where: { email }
        });

        res.status(200).json("Aluno excluído com sucesso!");

    } catch (error) {
        res.status(500).json({ msg: "Erro ao excluir aluno" });
    }
};

module.exports = {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
};