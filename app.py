import os
from flask import Flask, render_template, request, redirect, url_for, session, jsonify, make_response
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import check_password_hash, generate_password_hash

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:M!nha$enha123@localhost/db_Treinopro'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = os.urandom(24)

db = SQLAlchemy(app)

class Administrador(db.Model):
    id_administrador = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(255), unique=True, nullable=False)
    senha = db.Column(db.String(255), nullable=False)
    tipo_conta = db.Column(db.Integer, nullable=False)

class Professor(db.Model):
    id_professor = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255), unique=True, nullable=False)
    senha = db.Column(db.String(255), nullable=False)
    cpf = db.Column(db.String(11), nullable=False)
    telefone = db.Column(db.String(11), nullable=False)
    tipo_conta = db.Column(db.Integer, nullable=False)
    login = db.Column(db.String(255), nullable=False)

class Aluno(db.Model):
    id_aluno = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255), unique=True, nullable=False)
    nome = db.Column(db.String(255), nullable=False)
    senha = db.Column(db.String(255), nullable=False)
    cpf = db.Column(db.String(11), nullable=False)
    telefone = db.Column(db.String(11), nullable=False)
    tipo_conta = db.Column(db.Integer, nullable=False)
    login = db.Column(db.String(255), nullable=False)
    id_professor = db.Column(db.Integer, db.ForeignKey('professor.id_professor'))
    professor = db.relationship('Professor', backref=db.backref('alunos', lazy=True))
    avaliacao_fisica = db.Column(db.String(255))
    plano_alimentar = db.Column(db.String(255)) 
    plano_treino = db.Column(db.String(255))
    

with app.app_context():
    db.create_all()

@app.route('/')
def home():
    return render_template('/home.html')

@app.route('/home')
def home1():
    return render_template('/home.html')

@app.route('/cadastrar_personal' , methods=['GET'])
def cadastrar():
    return render_template('/cadastro_personal.html')

@app.route('/cadastrar_aluno' , methods=['GET'])
def cadastrar_aluno():
    return render_template('/cadastro_aluno.html')

@app.route('/cadastrar_personal', methods=['POST'])
def process_cadastro_personal():
    
    login = request.form['fullname']
    email = request.form['email']
    senha = request.form['password']
    cpf = request.form['cpf'].replace('.', '').replace('-', '') 
    telefone = request.form['telefone']
    tipo_conta = 2

    novo_professor = Professor(email=email, senha=senha, cpf=cpf, telefone=telefone, tipo_conta=tipo_conta, login=login)
    db.session.add(novo_professor)
    db.session.commit()

    return render_template('login.html')
    
@app.route('/cadastrar_aluno', methods=['POST'])
def process_cadastro_aluno():
    if 'usuario_id' in session:
        print("entrei")
        nome = request.form['fullname']
        login = request.form['fullname']
        email = request.form['email']
        senha = request.form['password']
        cpf = request.form['cpf'].replace('.', '').replace('-', '')  # Remover pontos e traço
        telefone = request.form['telefone']
        tipo_conta = 3
        id_professor = session.get('usuario_id')

        print(id_professor)

        novo_aluno = Aluno(email=email, nome=nome, senha=senha, cpf=cpf, telefone=telefone, tipo_conta=tipo_conta, login=login, id_professor=id_professor)
        db.session.add(novo_aluno)
        db.session.commit()

        return render_template('login.html')
    else:
        return redirect(url_for('login'))
    
@app.route('/comprar')
def comprar():
    return render_template('compra.html')

@app.route('/login', methods=['GET'])
def login():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def process_login():
    dados = request.json
    login_user = dados.get('username')
    senha_user = dados.get('password')

    print(login_user)
    print(senha_user)
    
    administrador = Administrador.query.filter_by(login=login_user).first()
    professor = Professor.query.filter_by(login=login_user).first()
    aluno = Aluno.query.filter_by(login=login_user).first()
   
    if administrador and administrador.senha == senha_user and administrador.tipo_conta == 1:
        session['usuario_id'] = administrador.id_administrador
        print("entrei em adm")
        return jsonify({'redirect': url_for('admin_dashboard')})
    elif professor and professor.senha == senha_user and professor.tipo_conta == 2:
        session['usuario_id'] = professor.id_professor
        print("entrei em prof")
        return jsonify({'redirect': url_for('professor_dashboard')})
    elif aluno and aluno.senha == senha_user and aluno.tipo_conta == 3:
        session['usuario_id'] = aluno.id_aluno
        print("entrei em aluno")
        return jsonify({'redirect': url_for('aluno_dashboard')})
    else:
        resposta = {'success': False, 'mensagem': 'Login ou senha incorretos'}
        return jsonify(resposta)



@app.route('/admin_dashboard')
def admin_dashboard():
    print("usuario id: ", session)
    if 'usuario_id' in session:
        print("entrei")
        personal_trainers = Professor.query.all()
        return render_template('admin_dashboard.html', personal_trainers=personal_trainers)
    else:
        return redirect(url_for('login'))


@app.route('/professor_dashboard')
def professor_dashboard():
    if 'usuario_id' in session:
        professor_id = session['usuario_id']
        
        alunos = Aluno.query.filter_by(id_professor=professor_id).all()
        
        return render_template('professor_dashboard.html', alunos=alunos)
    else:
        return redirect(url_for('login'))



@app.route('/aluno_dashboard')
def aluno_dashboard():
    if 'usuario_id' in session:
        print("entrei")
        
        
        aluno = Aluno.query.filter_by(id_aluno=session['usuario_id']).first()
        if aluno:
            return render_template('aluno_dashboard.html', aluno=aluno)
        else:
            return redirect(url_for('login'))    
    else:
        return redirect(url_for('login'))

@app.route('/get_personal_trainers')
def get_personal_trainers():
    try:
        personal_trainers = PersonalTrainer.query.all()
        formatted_personal_trainers = [{
            'id': trainer.id_professor,
            'nome': trainer.login,
            'email': trainer.email,
            'telefone': trainer.telefone,
        } for trainer in personal_trainers]
        return jsonify(formatted_personal_trainers)
    except Exception as e:
        return jsonify({'error': str(e)})


@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))


@app.route('/delete_personal_trainer/<int:id>', methods=['POST'])
def delete_personal_trainer(id):
    if 'usuario_id' not in session:
        return redirect(url_for('login'))

    administrador = Administrador.query.get(session['usuario_id'])
    if not administrador:
        return redirect(url_for('login'))

    professor = Professor.query.get(id)
    if not professor:
        return redirect(url_for('admin_dashboard'))

    Aluno.query.filter_by(id_professor=id).delete()

    db.session.delete(professor)
    db.session.commit()

    return redirect(url_for('admin_dashboard'))

@app.route('/delete_aluno/<int:id>', methods=['POST'])
def delete_aluno(id):
    if 'usuario_id' not in session:
        return redirect(url_for('login'))

    professor = Professor.query.get(session['usuario_id'])
    if not professor:
        return redirect(url_for('login'))

    aluno = Aluno.query.get(id)
    if not aluno:
        return redirect(url_for('professor_dashboard'))

    db.session.delete(aluno)
    db.session.commit()

    return redirect(url_for('professor_dashboard'))


###############################################################################################

@app.route('/upload_arquivos', methods=['GET'])
def upload_arquivos():
    alunos = Aluno.query.all()  # Busca todos os alunos
    return render_template('upload_arquivos.html', alunos=alunos)

@app.route('/upload_arquivos', methods=['POST'])
def upload_file():
    aluno_id = request.form.get('aluno')  # Obtém o ID do aluno selecionado

    aluno = Aluno.query.get(aluno_id)  # Obtém o aluno pelo ID

    tipo_arquivo = request.form.get('tipo_arquivo')  # Obtém o tipo de arquivo selecionado
    arquivo = request.files.get('arquivo')  # Obtém o arquivo enviado pelo formulário

    if tipo_arquivo == 'avaliacao_fisica':
        aluno.avaliacao_fisica = arquivo.read()
    elif tipo_arquivo == 'plano_alimentar':
        aluno.plano_alimentar = arquivo.read()
    elif tipo_arquivo == 'plano_treino':
        aluno.plano_treino = arquivo.read()

    db.session.commit()

    return 'Arquivo enviado com sucesso para o aluno {}'.format(aluno.nome)


@app.route('/get_pdf_path', methods=['POST'])
def get_pdf_path():

    print("entrei")
      
    print("passei")
        
    tipo_arquivo = request.form.get('tipo_arquivo')
    
    id_aluno = request.form.get('id_aluno')
    tipo = request.form.get('tipo')

    aluno = Aluno.query.filter_by(id=id_aluno).first()
    if not aluno:
        return 'Aluno não encontrado'

    if tipo == 'treino':
        pdf_data = aluno.ficha_treino
    elif tipo == 'avaliacao':
        pdf_data = aluno.avaliacao_fisica
    elif tipo == 'alimentacao':
        pdf_data = aluno.plano_alimentar
    else:
        return 'Tipo de arquivo inválido'

    if pdf_data:
        response = make_response(pdf_data)
        response.headers['Content-Type'] = 'application/pdf'
        response.headers['Content-Disposition'] = f'attachment; filename={tipo}.pdf'
        return response
    else:   
        return 'PDF não encontrado para este aluno'
  
###############################################################################################

if __name__ == '__main__':
    app.run(debug=True)
