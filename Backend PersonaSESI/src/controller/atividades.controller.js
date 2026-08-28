const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    try {
        const item = await prisma.atividades.create({
            data: req.body
        });
        res.status(201).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao cadastrar atividade" });
    }
};

const listar = async (req, res) => {
    try {
        const lista = await prisma.atividades.findMany();
        res.status(200).json(lista);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao listar atividades" });
    }
};

const buscar = async (req, res) => {
    try {
        const { id } = req.params;

        const item = await prisma.atividades.findUnique({
            where: { id: Number(id) }
        });

        if (!item) {
            return res.status(404).json({ msg: "Atividade não encontrada" });
        }

        res.status(200).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao buscar atividade" });
    }
};

const atualizar = async (req, res) => {
    try {
        const { id } = req.params;

        const item = await prisma.atividades.update({
            where: { id: Number(id) },
            data: req.body
        });

        res.status(200).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao atualizar atividade" });
    }
};

const excluir = async (req, res) => {
    try {
        const { id } = req.params;

        const item = await prisma.atividades.delete({
            where: { id: Number(id) }
        });

        res.status(200).json("Atividade excluída com sucesso!");
    } catch (error) {
        res.status(500).json({ msg: "Erro ao excluir atividade" });
    }
};

module.exports = {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
};