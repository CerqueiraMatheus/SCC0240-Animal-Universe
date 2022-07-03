from psycopg2 import DataError, IntegrityError
from time import sleep
import inquirer
from inquirer.themes import GreenPassion
from terminal import *
from auxiliar import *

def paginaInicial(user):
    title("Página Inicial")
    choices = ['Identificação',
                'Cadastro',
                'Busca de Animal',
                'Apadrinhar',
                'Desapadrinhar',
                'Ver Espécimes'
            ]
    
    if user == 'Biólogo':
        choices += ['Criar Alerta', 'Criar Animal', 'Deletar Animal', 'Pesquisar Animais em Risco'] # adicionar Atualizar Animal
    elif user == 'Organização':
        choices += ['Ver Alertas']
    elif user != "Usuário":
        choices += ['Trocar Espécimes']
        if user == 'Cuidador':
            choices += ['Atualizar Estado']
        elif user == 'Gestor':
            choices += ['Cadastrar Espécime', 'Disponibilizar Apadrinhamento']
        elif user == 'Veterinário':
            choices += ['Realizar Consulta']
    
    choices += ['Sair']
    
    questions = [
    inquirer.List('ação', 
                  message='Selecione uma ação',
                  choices=choices,
                  carousel=True)
    ]
        
    answers = inquirer.prompt(questions, theme=GreenPassion())
    return answers 

def identificacao():
    title("Identificação")
    answers = basicRoutes()
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('nacionalidade', 'Digite sua nacionalidade'),
            inquirer.Text('documento', 'Digite seu documento de identificação')
        ]
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}
    return answers

def cadastro(cursor, insercoes, conn):
    title("Cadastro")
    answers = basicRoutes()
    clear()
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('nacionalidade', 'Digite sua nacionalidade'),
            inquirer.Text('documento', 'Digite seu documento de identificação'),
            inquirer.Text('nome', 'Digite seu nome completo')
        ]
        title("Cadastro - Informações Básicas")
        basic = inquirer.prompt(questions, theme=GreenPassion())
        clear()
        questions = [
            inquirer.List('tipo', 
                        message='Selecione um tipo',
                        choices=['Usuário',
                                'Biólogo',
                                'Organização',
                                'Funcionario',
                                'Cuidador',
                                'Gestor',
                                'Veterinário'],
                        carousel=True)
        ]
        
        print()
        title("Cadastro - Tipo")
        type = inquirer.prompt(questions, theme=GreenPassion())
        clear()
        
        questions = None
        if type['tipo'] == "Biólogo":
            questions = [
                inquirer.Text('formacao', 'Digite seu nível de formação'),
                inquirer.Text('curriculo', 'Digite seu currículo')
            ]
        elif type['tipo'] == "Organização":
            questions = [
                inquirer.Text('certificacoes', 'Digite suas certificações')
            ]
        elif type['tipo'] != "Usuário" and type['tipo'] != "Biólogo" and type['tipo'] != "Organização":
            questions = [
                inquirer.Text('dataInicio', 'Digite a data em que começou a trabalhar (yyyy-mm-dd)'),
                inquirer.Text('zoologico', 'Digite o zoológico em trabalha')
            ]
        
        print()
        title("Cadastro - Informações Específicas")
        data = basic | type
        if questions != None:
            specifics = inquirer.prompt(questions, theme=GreenPassion())
            data = data | specifics
            clear()
            
        if (type['tipo'] == 'Usuário'):
            try:
                cursor.execute(insercoes[0], (data['documento'], data['nacionalidade'], data['nome'], None))
            except IntegrityError:
                print('Usuário com documento e nacionalidade já existente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            except DataError:
                print("Campo com muitos caracteres")
                sleep(3)
                return {'ação': 'Página Inicial'}
        elif (type['tipo'] == 'Biólogo'):
            try:
                cursor.execute(insercoes[0], (data['documento'], data['nacionalidade'], data['nome'], data['tipo']))
                cursor.execute(insercoes[1], (data['formacao'], data['curriculo']))
            except IntegrityError:
                print('Usuário com documento e nacionalidade já existente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            except DataError:
                print("Campo com muitos caracteres")
                sleep(3)
                return {'ação': 'Página Inicial'}
        elif (type['tipo'] == 'Organização'):
            try:
                cursor.execute(insercoes[0], (data['documento'], data['nacionalidade'], data['nome'], data['tipo']))
                cursor.execute(insercoes[2])
            except IntegrityError:
                print('Usuário com documento e nacionalidade já existente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            except DataError:
                print("Campo com muitos caracteres")
                sleep(3)
                return {'ação': 'Página Inicial'}
        elif (type['tipo'] == 'Funcionario'):
            try:
                cursor.execute(insercoes[0], (data['documento'], data['nacionalidade'], data['nome'], data['tipo']))
            except IntegrityError:
                print('Usuário com documento e nacionalidade já existente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            except DataError:
                print("Campo com muitos caracteres")
                sleep(3)
                return {'ação': 'Página Inicial'}
            try:
                cursor.execute(insercoes[3], (data['dataInicio'], data['zoologico'], data['tipo']))
            except:
                print('Este zoológico não existe. Por favor, tente novamente')
                sleep(3)
                return {'ação': 'Página Inicial'}
        elif (type['tipo'] == 'Gestor'):
            try:
                cursor.execute(insercoes[0], (data['documento'], data['nacionalidade'], data['nome'], data['tipo']))
            except IntegrityError:
                print('Usuário com documento e nacionalidade já existente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            except DataError:
                print("Campo com muitos caracteres")
                sleep(3)
                return {'ação': 'Página Inicial'}
            try:
                cursor.execute(insercoes[3], (data['dataInicio'], data['zoologico'], data['tipo']))
            except:
                print('Este zoológico não existe. Por favor, tente novamente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            cursor.execute(insercoes[4])
        elif (type['tipo'] == 'Veterinário'):
            try:
                cursor.execute(insercoes[0], (data['documento'], data['nacionalidade'], data['nome'], data['tipo']))
            except IntegrityError:
                print('Usuário com documento e nacionalidade já existente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            except DataError:
                print("Campo com muitos caracteres")
                sleep(3)
                return {'ação': 'Página Inicial'}
            try:
                cursor.execute(insercoes[3], (data['dataInicio'], data['zoologico'], data['tipo']))
            except:
                print('Este zoológico não existe. Por favor, tente novamente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            cursor.execute(insercoes[5])
        elif (type['tipo'] == 'Cuidador'):
            try:
                cursor.execute(insercoes[0], (data['documento'], data['nacionalidade'], data['nome'], data['tipo']))
            except IntegrityError:
                print('Usuário com documento e nacionalidade já existente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            except DataError:
                print("Campo com muitos caracteres")
                sleep(3)
                return {'ação': 'Página Inicial'}
            try:
                cursor.execute(insercoes[3], (data['dataInicio'], data['zoologico'], data['tipo']))
            except:
                print('Este zoológico não existe. Por favor, tente novamente')
                sleep(3)
                return {'ação': 'Página Inicial'}
            cursor.execute(insercoes[6])

        conn.commit()
        count = cursor.rowcount
        print(count, "Record inserted successfully into mobile table")
        sleep(3)
            
        return data | {"ação": "Página Inicial"}
    
    # devemos retornar o id do usuário
    return answers

def buscaAnimal():
    title("Busca de Animal")
    questions = [
        inquirer.List('ação',
                    message='Selecione uma ação',
                    choices=['Manter',
                                'Voltar',
                            'Página Inicial',
                            'Relatos',
                            'Fórum'])
    ]
    answers = inquirer.prompt(questions, theme=GreenPassion())
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('animal', 'Digite o animal que deseja buscar'),
        ]
        animal = inquirer.prompt(questions, theme=GreenPassion())
        answers = animal | {"ação": "Página Inicial"}
        
        # Precisamos mostrar os animais que correspondem a busca e se não tiver resultados, falar isso
        
    return answers

def apadrinhar():
    title("Apadrinhamento")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('especimeID', "Insira o ID do espécime que deseja apadrinhar"),
            inquirer.Text('valor', "Insira o valor que deseja doar por mês")
        ]
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}
        
    return answers

def desapadrinhar():
    title("Desapadrinhamento")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('especimeID', "Insira o ID do espécime que deseja desapadrinhar")
        ]
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}
    return answers

def verEspecimes():
    title("Ver Espécimes")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        # Mostrar todos os espécimes (animal, nome e ID)
        print("info aqui")
        sleep(5)
        return {'ação': 'Página Inicial'}
        
    return answers

def relatos():
    title("Relatos")
    questions = [
        inquirer.List('ação',
                    message='Selecione uma ação',
                    choices=['Manter',
                            'Voltar',
                            'Página Inicial',
                            'Criar Relato'
                            ])
    ]
    
    
    # Passar o animal como parâmetro
    # Precisamos mostrar todos os relatos relacionados a um determinado animal (usuário, data/hora)
    # utilizar relato() para redirecionar a um determinado relato
    answers = inquirer.prompt(questions, theme=GreenPassion())
    if (answers['ação'] == 'Manter'):
        return {"ação": "Relato"}
    return answers

def relato(animal):
    title("Relato")
    # Mostrar as informações 
    # Parar de mostrar na tela quando a pessoa apertar Enter
    questions = [
        inquirer.List('ação',
                    message = 'Selecione uma ação',
                    choices=['Voltar',
                             'Página Inicial',
                             'Comentar'])
    ]
    answers = inquirer.prompt(questions, theme=GreenPassion())
    clear()
    if (answers['ação'] == 'Comentar'):
        questions = [
            inquirer.Text('comentario', message="Escreva um comentário")
        ]
        answers = inquirer.prompt(questions, theme=GreenPassion())
        return answers | {"ação": "Página Inicial"}
    # Passar o relato ou a chave dele no parametro ou ele proprio
    
    return answers
    
def criarRelato():
    title("Criação de Relato")
    answers = basicRoutes()
    clear()

    if (answers['ação'] == 'Manter'):
        questions = [
            # incluir data e hora do sistema
            inquirer.Text('latitude', message='Digite a latitude do encontro'),
            inquirer.Text('longitude', message='Digite a longitude do encontro'),
            inquirer.Text('descrição', message='Escreva uma descrição'),
            inquirer.Text('áudio', message='Digite as URLs dos áudios'),
            inquirer.Text('vídeo', message='Digite as URLs dos vídeos'),
            inquirer.Text('foto', message='Digite as URLs das fotos')
        ]
        
        answers = inquirer.prompt(questions, theme=GreenPassion())
        return answers | {"ação": "Página Inicial"}
    
    return answers