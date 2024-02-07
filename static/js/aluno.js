$(document).ready(function() {
    // Função para fazer uma solicitação AJAX para obter o caminho do arquivo PDF do servidor
    function downloadPDF(tipoArquivo) {
        $.ajax({
            url: '/get_pdf_path',  // Rota no servidor para obter o caminho do arquivo PDF
            method: 'POST',
            data: { tipo_arquivo: tipoArquivo },  // Enviar o tipo de arquivo para o servidor
            success: function(response) {
                if (response && response.path) {
                    // Abrir o arquivo PDF em uma nova guia
                    window.open(response.path, '_blank');
                } else {
                    console.error('Caminho do arquivo não encontrado.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Erro ao obter o caminho do arquivo:', error);
            }
        });
    }

    // Adicionar evento de clique aos botões de treino
    $('.botao-treino').click(function() {
        downloadPDF('avaliacao_fisica');
    });

    // Adicionar evento de clique aos botões de avaliação física
    $('.botao-evolucao').click(function() {
        downloadPDF('plano_alimentar');
    });

    // Adicionar evento de clique aos botões de plano alimentar
    $('.botao-alimentacao').click(function() {
        downloadPDF('plano_treino');
    });
});
