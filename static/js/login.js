function login() {
    console.log("Função de login acionada.");

    var form = document.getElementById("login-form");
    var username = form.elements.username.value;
    var password = form.elements.password.value;

    // Enviar uma solicitação AJAX para o servidor
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/login", true);

    // Configurar cabeçalhos da solicitação
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.setRequestHeader("Accept", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            // Primeiro, vamos tentar converter a resposta em texto
            var responseText = xhr.responseText;
            console.log("Resposta completa do servidor: ", responseText);
    
            try {
                var response = JSON.parse(responseText);
    
                if (response.redirect) {
                    // Redirecionar para a nova URL
                    window.location.href = response.redirect;
                } else if (response.success) {
                    alert("Login bem-sucedido.");
                } else {
                    alert("Login falhou. " + response.mensagem);
                }
            } catch (error) {
                alert("Ocorreu um erro durante o login: " + error.message);
                console.error(error);
            }
        }
    };
    
    
    // Converter dados para JSON e enviar
    var data = JSON.stringify({ username: username, password: password });
    xhr.send(data);
    console.log("Dados enviados:", { username, password });
}
