const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    try {
        const item = await prisma.coordenadores.create({
            data: req.body
        });
        res.status(201).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao cadastrar coordenador" });
    }
};

const listar = async (req, res) => {
    try {
        const lista = await prisma.coordenadores.findMany();
        res.status(200).json(lista);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao listar coordenadores" });
    }
};

const buscar = async (req, res) => {
    try {
        const { email } = req.params;

        const item = await prisma.coordenadores.findUnique({
            where: { email }
        });

        if (!item) {
            return res.status(404).json({ msg: "Coordenador não encontrado" });
        }

        res.status(200).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao buscar coordenador" });
    }
};

const atualizar = async (req, res) => {
    try {
        const { email } = req.params;

        const item = await prisma.coordenadores.update({
            where: { email },
            data: req.body
        });

        res.status(200).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao atualizar coordenador" });
    }
};

const excluir = async (req, res) => {
    try {
        const { email } = req.params;

        const item = await prisma.coordenadores.delete({
            where: { email }
        });

        res.status(200).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao excluir coordenador" });
    }
};

module.exports = {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
};