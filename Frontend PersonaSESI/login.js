function login() {
    const email = document.querySelector("#email").value;
    const senha = document.querySelector("#senha").value;

    fetch("http://localhost:3000/auth/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json", // Tell server we're sending JSON
            "Accept": "application/json"        // Expect JSON in response
        },
        body: JSON.stringify({ email: email, senha: senha })
    })
        .then(resp => { return resp.json() })
        .then(data => {
            console.log(data);
        })
} 

//PROFESSOR
function loginProfessor() {
const email = document.querySelector("#email").value;
const senha = document.querySelector("#senha").value;


fetch("http://localhost:3000/auth/login", {
    method: "POST",
    headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
    },
    body: JSON.stringify({
        email: email,
        senha: senha
    })
})
    .then(resp => {
        if (!resp.ok) {
            throw new Error("E-mail ou senha incorretos");
        }

        return resp.json();
    })
    .then(data => {
        console.log(data);

        if (data.usuario.perfil !== "PROFESSOR") {
            alert("Este usuário não é um professor.");
            return;
        }

        localStorage.setItem("token", data.token);
        localStorage.setItem("usuario", JSON.stringify(data.usuario));

        window.location.href = "professor.html";
    })
    .catch(error => {
        console.error(error);
        alert(error.message);
    });
}  




//COORDENADOR
function loginCoordenador() {
const email = document.querySelector("#email").value;
const senha = document.querySelector("#senha").value;

fetch("http://localhost:3000/auth/login", {
    method: "POST",
    headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
    },
    body: JSON.stringify({
        email: email,
        senha: senha
    })
})
    .then(resp => {
        if (!resp.ok) {
            throw new Error("E-mail ou senha incorretos");
        }

        return resp.json();
    })
    .then(data => {
        console.log(data);

        if (data.usuario.perfil !== "COORDENADOR") {
            alert("Este usuário não é um coordenador.");
            return;
        }

        localStorage.setItem("token", data.token);
        localStorage.setItem("usuario", JSON.stringify(data.usuario));

        window.location.href = "coordenador.html";
    })
    .catch(error => {
        console.error(error);
        alert(error.message);
    });
}
