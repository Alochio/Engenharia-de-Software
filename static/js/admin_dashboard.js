fetch('/get_personal_trainers')
    .then(response => response.json())
    .then(data => {
        exibirPersonalTrainers(data); // Chama a função após obter os dados
    })
    .catch(error => console.error('Erro:', error));

window.addEventListener('DOMContentLoaded', (event) => {
    fetch('/get_personal_trainers')
        .then(response => response.json())
        .then(data => exibirPersonalTrainers(data))
        .catch(error => console.error('Erro:', error));
});

function exibirPersonalTrainers(personalTrainers) {
    var personalTrainersList = document.getElementById("personal-trainers-list");
    personalTrainersList.innerHTML = ""; // Limpar a lista antes de exibir os resultados

    personalTrainers.forEach(function (personalTrainer) {
        var personalTrainerDiv = document.createElement("div");
        personalTrainerDiv.classList.add("personal-trainer");

        var nomeParagraph = document.createElement("p");
        nomeParagraph.textContent = "Nome: " + personalTrainer.nome;

        var emailParagraph = document.createElement("p");
        emailParagraph.textContent = "Email: " + personalTrainer.email;

        var telefoneParagraph = document.createElement("p");
        telefoneParagraph.textContent = "Telefone: " + personalTrainer.telefone;

        personalTrainerDiv.appendChild(nomeParagraph);
        personalTrainerDiv.appendChild(emailParagraph);
        personalTrainerDiv.appendChild(telefoneParagraph);

        personalTrainersList.appendChild(personalTrainerDiv);
    });
}
