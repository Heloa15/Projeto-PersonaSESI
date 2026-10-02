async function carregarAluno() {
    try {
       
        const idAluno = localStorage.getItem("idAluno");

    
        if (!idAluno) {
            throw new Error("Nenhum idAluno foi encontrado no localStorage.");
        }

        const url = `http://localhost:3000/alunos/buscar/${idAluno}`;

        const resposta = await fetch(url, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        });

        console.log("Status da resposta:", resposta.status);

        if (!resposta.ok) {
            const textoErro = await resposta.text();

            console.error("Resposta da API:", textoErro);

            throw new Error(
                `Erro ${resposta.status}: ${textoErro}`
            );
        }

        const aluno = await resposta.json();

        console.log("Aluno recebido da API:", aluno);

        if (!aluno.nome) {
            throw new Error(
                "A API respondeu, mas não encontrou o campo 'nome'."
            );
        }

        const boasVindas = document.getElementById("boasVindas");

        if (boasVindas) {
            boasVindas.textContent =
                `Bem-vindo, ${aluno.nome}!`;
        }

        const usuario = document.getElementById("usuario");

        if (usuario) {
            usuario.textContent =
                `${aluno.email} (Aluno)`;
        }

    } catch (error) {

        console.error("ERRO COMPLETO:", error);

        const boasVindas = document.getElementById("boasVindas");

        if (boasVindas) {
            boasVindas.textContent =
                "Não foi possível carregar seus dados.";
        }

        const usuario = document.getElementById("usuario");

        if (usuario) {
            usuario.textContent =
                `Erro: ${error.message}`;
        }
    }
}




function fazerLogoff() {

    localStorage.removeItem("idAluno");
    localStorage.removeItem("token");

    window.location.href = "login.aluno.html";
}



const btnSair = document.getElementById("btnSair");

if (btnSair) {
    btnSair.addEventListener("click", fazerLogoff);
}




carregarAluno();