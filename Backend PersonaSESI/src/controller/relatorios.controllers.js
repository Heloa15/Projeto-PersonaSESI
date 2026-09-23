const prisma = require("../data/prisma");

const calcularEstatisticas = async (req, res) => {

    try {

        const totalAlunos = await prisma.alunos.count();
        const totalProfessores = await prisma.professores.count();
        const totalCoordenadores = await prisma.coordenadores.count();
        const totalResponsaveis = await prisma.responsaveis.count();

        const retorno = {

            totalAlunos,
            totalProfessores,
            totalCoordenadores,
            totalResponsaveis
        }

        res.json(retorno).end();

    } catch(e) {

        res.json(e).end();

    }

};

const estatisticasAluno = async (req, res) => {

    const idAluno = req.query.id;

    const dados = await prisma.alunos.findMany({

        where: {

            id: Number(idAluno)

        },

        include: {

            _count: {

                select: {atividades: true}

            }

        }

    });

    res.json(dados).end();

}

const relatorioAluno = async (req, res) => {

    try {

        const idAluno = Number(req.params.id);
        const atividades = await prisma.atividades.findMany({

            where: {

                alunoId: idAluno

            }

        });

        const materias = [...new Set(
            atividades.map(atividade => atividade.materia)
        )];

        const tarefasPendentes = atividades.filter(atividade => {
            return atividade.status === "Pendente";
        });

        const tarefasConcluidas = atividades.filter(atividade => {
            return atividade.status === "Concluído";
        });

        const retorno = {
            materias,
            tarefasPendentes,
            tarefasConcluidas
        };

        res.status(200).json(retorno);

    } catch(e) {

        console.log(e);

        res.status(500).json(e);

    }

};

const relatorioProfessor = async (req, res) => {

    try {

        const idProfessor = Number(req.params.id);

        const atividades = await prisma.atividades.findMany({

            where: {

                professorId: idProfessor

            },

            select: {

                alunoId: true

            }

        });

        const alunos = [...new Set(
            atividades.map(atividade => atividade.alunoId)
        )];

        const tarefasCriadas = await prisma.atividades.count({

            where: {

                professorId: idProfessor

            }

        });

        const retorno = {
            totalAlunos: alunos.length,
            tarefasCriadas
        };

        res.status(200).json(retorno);

    } catch(e) {

        console.log(e);

        res.status(500).json(e);

    }

};

const relatorioCoordenador = async (req, res) => {

    try {

        const idCoordenador = Number(req.params.id);

        const totalAlunos = await prisma.alunos.count();

        const atividades = await prisma.atividades.findMany({

            where: {

                professor: {

                    coordenadorId: idCoordenador

                }

            },

            select: {

                materia: true,
                alunoId: true

            }

        });

        const materias = {};

        atividades.forEach(atividade => {

            if (!materias[atividade.materia]) {

                materias[atividade.materia] = [];

            }

            if (!materias[atividade.materia].includes(atividade.alunoId)) {

                materias[atividade.materia].push(atividade.alunoId);

            }

        });

        const alunosPorMateria = Object.keys(materias).map(materia => {

            return {

                materia: materia,
                totalAlunos: materias[materia].length

            };

        });

        const retorno = {

            totalAlunos,
            alunosPorMateria

        };

        res.status(200).json(retorno);

    } catch(e) {

        console.log(e);

        res.status(500).json(e);

    }

};

module.exports = {

    calcularEstatisticas,
    estatisticasAluno,
    relatorioAluno,
    relatorioProfessor,
    relatorioCoordenador

}