# TreinoPro - Site de Gerenciamento de alunos para Personais Trainers

Este é um site desenvolvido para auxiliar na gestão de treinos, permitindo que professores e alunos tenham acesso a informações relevantes, como fichas de treino, avaliações físicas e planos alimentares.

**Funcionalidades:**

1. **Login e Registro de Usuários:**
   - Professores e alunos podem se registrar e fazer login no sistema para acessar suas contas.

2. **Dashboard do Professor:**
   - Os professores têm acesso a um painel onde podem visualizar informações sobre seus alunos, criar e editar fichas de treino, avaliações físicas e planos alimentares.

3. **Dashboard do Aluno:**
   - Os alunos têm acesso a um painel onde podem visualizar informações sobre seus treinos, avaliações físicas e planos alimentares.

4. **Upload de Arquivos:**
   - Os professores podem fazer upload de fichas de treino, avaliações físicas e planos alimentares para cada aluno, mantendo um registro organizado de suas atividades.

5. **Download de Arquivos:**
   - Tanto professores quanto alunos podem fazer download dos arquivos associados às suas contas, facilitando o acesso às informações relevantes.

**Instruções de Uso:**

1. **Registro e Login:**
   - Os usuários devem se entrar em contato por email para que seja criado o seu perfil de personal.
   - Após o registro, eles podem fazer login usando suas credenciais.

2. **Dashboard:**
   - Os professores são direcionados para o dashboard do professor após fazer login, onde podem visualizar e gerenciar informações sobre seus alunos.
   - Os alunos são direcionados para o dashboard do aluno, onde podem visualizar informações sobre seus treinos e planos.

3. **Upload de Arquivos:**
   - Os professores podem fazer upload de fichas de treino, avaliações físicas e planos alimentares para cada aluno, selecionando o aluno correto e o tipo de arquivo desejado.
   - Os alunos não têm permissão para fazer upload de arquivos, apenas para fazer download dos arquivos associados às suas contas.

4. **Download de Arquivos:**
   - Tanto professores quanto alunos podem fazer download dos arquivos associados às suas contas, selecionando o tipo de arquivo desejado e clicando no botão de download correspondente.

**Tecnologias Utilizadas:**

- Flask: Framework web para desenvolvimento em Python.
- SQLAlchemy: Biblioteca de mapeamento objeto-relacional para interagir com o banco de dados.
- HTML/CSS: Linguagens de marcação e estilo para design e estruturação das páginas web.
- JavaScript: Linguagem de programação utilizada para interações dinâmicas na página.

**Instruções de Instalação:**

1. Clone este repositório em sua máquina local.
2. Instale as dependências do Python:

   ````plaintext
    pip install mysql-connector-python Flask Flask-SQLAlchemy mysqlclient Flask-WTF requests

3. Configure o banco de dados de acordo com as configurações especificadas no arquivo `pythonsql.py`.
4. Execute o arquivo `app.py` para iniciar o servidor Flask.
5. Acesse o site em seu navegador utilizando o endereço local fornecido pelo Flask.

**Contribuições:**

- Contribuições são bem-vindas! Sinta-se à vontade para propor melhorias, corrigir bugs ou adicionar novas funcionalidades ao projeto.


