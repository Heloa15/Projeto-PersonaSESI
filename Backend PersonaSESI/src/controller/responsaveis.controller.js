const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    try {
        const item = await prisma.responsaveis.create({
            data: req.body
        });

        res.status(201).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao cadastrar responsável" });
    }
};

const listar = async (req, res) => {
    try {
        const lista = await prisma.responsaveis.findMany();
        res.json(lista);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao listar responsáveis" });
    }
};

const buscar = async (req, res) => {
    try {
        const { cpf } = req.params;

        const item = await prisma.responsaveis.findUnique({
            where: { cpf }
        });

        if (!item) {
            return res.status(404).json({ msg: "Responsável não encontrado" });
        }

        res.json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao buscar responsável" });
    }
};

const atualizar = async (req, res) => {
    try {
        const { cpf } = req.params;

        const item = await prisma.responsaveis.update({
            where: { cpf },
            data: req.body
        });

        res.json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao atualizar responsável" });
    }
};

const excluir = async (req, res) => {
    try {
        const { cpf } = req.params;

        const item = await prisma.responsaveis.delete({
            where: { cpf: cpf }
        });

        res.json("Responsável excluído com sucesso!");
    } catch (error) {
        res.status(500).json({ msg: "Erro ao excluir responsável" });
    }
};

module.exports = {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
};