const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    try {
        const item = await prisma.professores.create({
            data: req.body
        });
        res.status(201).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao cadastrar professor" });
    }
};

const listar = async (req, res) => {
    try {
        const lista = await prisma.professores.findMany();
        res.status(200).json(lista);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao listar professores" });
    }
};

const buscar = async (req, res) => {
    try {
        const { email } = req.params;

        const item = await prisma.professores.findUnique({
            where: { email }
        });

        if (!item) {
            return res.status(404).json({ msg: "Professor não encontrado" });
        }

        res.status(200).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao buscar professor" });
    }
};

const atualizar = async (req, res) => {
    try {
        const { email } = req.params;

        const item = await prisma.professores.update({
            where: { email },
            data: req.body
        });

        res.status(200).json(item);
    } catch (error) {
        res.status(500).json({ msg: "Erro ao atualizar professor" });
    }
};

const excluir = async (req, res) => {
    try {
        const { email } = req.params;

        const item = await prisma.professores.delete({
            where: { email: email }
        });

        res.status(200).json("Professor excluído com sucesso!");
    } catch (error) {
        console.log(error);
        res.status(500).json({ msg: "Erro ao excluir professor" });
    }
};

module.exports = {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
};