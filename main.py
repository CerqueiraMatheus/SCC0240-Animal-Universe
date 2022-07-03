import psycopg2
from time import sleep
import inquirer
from inquirer.themes import GreenPassion
import os
from terminal import *
import sys, readchar

def clear():
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')
    
def title(text):
    s = Color(text)
    print(s.green_bg.white.underline)
        
def basicRoutes():
    questions = [
            inquirer.List('ação',
                        message='Selecione uma ação',
                        choices=['Manter',
                                 'Voltar',
                                'Página Inicial'])
    ]
    return inquirer.prompt(questions, theme=GreenPassion())
        
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
        choices += ['Criar Alerta', 'Criar Animal', 'Deletar Animal'] # adicionar CUD Animal
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

def cadastro():
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
                inquirer.Text('dataInicio', 'Digite a data em que começou a trabalhar')
            ]
        
        print()
        title("Cadastro - Informações Específicas")
        data = basic | type
        if questions != None:
            specifics = inquirer.prompt(questions, theme=GreenPassion())
            data = data | specifics
            clear()
            
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

def criarAnimal():
    title("Criação de Animal")
    

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
    
def criarAlerta():
    title("Criação de Alerta")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('descrição', message='Escreva uma descrição do perigo'),
            # Pode ser um multiselect de relatos do animal tbm
            inquirer.Text('relatos', message='Escreva os IDs dos relatos')
        ]
        
        answers = inquirer.prompt(questions, theme=GreenPassion())
        return answers | {"ação": "Página Inicial"}
    
    return answers

def verAlertas():
    title("Ver Alertas")
    answers = basicRoutes()
    clear()
    if (answers['ação'] == 'Manter'):
        print("Mostrar os alertas aqui")
        sleep(5) # Mudar isso para "Ler enquanto a pessoa n apertar Enter"
        # Mostrar Animal, Descrição do Perigo e Data e Hora do Alerta
        return {"ação": "Página Inicial"}

    return answers

def alerta():
    title("Alerta")
    answers = basicRoutes()
    clear()

    if (answers['ação'] == 'Manter'):
        print("info aqui")
        sleep(5)
        return {"ação": "Página Inicial"}
    
    return answers

def atualizarEstado():
    title("Atualizar Estado do Espécime")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('condição', 'Descreva a condição do espécime')
        ]
        answers = inquirer.prompt(questions, theme=GreenPassion())
        return answers | {"ação": "Página Inicial"}
        
    return answers

def cadastrarEspecime():
    title("Cadastrar Espécime")
    questions = [
        inquirer.Text("nome", "Insira o nome do espécime"),
        inquirer.Text("sexo", "Insira o sexo do espécime"),
        inquirer.Text("idade", "Insira a idade do espécime"),
        inquirer.Text("hábito", "Descreva os hábitos do espécime"),
        inquirer.Text("temperamento", "Descreva os temperamentos do espécime")
    ]
    return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}

def disponibilizar():
    title("Disponibilizar para Apadrinhamento")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('especimeID', "Insira o ID do espécime")
        ]
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}
    return answers

def consulta():
    title("Realizar Consulta")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('diagnostico', "Insira o diagnóstico do espécime"),
            inquirer.Text('tratamento', 'Insira o tratamento do espécime')
        ]
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}

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

def criarAnimal():
    title("Criação de Animais")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('nome', message='Digite o nome do animal'),
            inquirer.Text('nome_cientifico', message='Digite o nome científico do animal'),
            inquirer.Text('descrição', message='Escreva a descrição do animal'),
            inquirer.Text('nível trófico', message='Digite o nível trófico do animal'),
            inquirer.Text('vertebrado', message='Digite True se o animal for vertebrado, False, caso contrário'),
            inquirer.Text('habitat', 'Descreva o habitat do animal'),
            inquirer.Text('comportamento', message='Descreva o comportamento do animal'),
            inquirer.Text('reprodução', message='Descreva a reprodução dos animais'),
            inquirer.Text('filo', message='Digite o filo do animal'),
            inquirer.Text('classe', message='Digite a classe do animal'),
            inquirer.Text('ordem', message='Digite a ordem do animal'),
            inquirer.Text('família', message='Digite a família do animal'),
            inquirer.Text('gênero', message='Digite o gênero do animal'),
            inquirer.Text('espécie', message='Digite a espécie do animal'),
            inquirer.Text('extinto', message='Digite True se o animal estiver extinto, False, caso contrário'),
            inquirer.Text('vídeo', message='Digite os vídeos desse animal'),
            inquirer.Text('áudio', message='Digite os áudios desse animal'),
            inquirer.Text('foto', message='Digite as fotos desse animal'),
        ]
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}
    
    return answers

def deletarAnimal():
    title("Deleção de Animais")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('animal', 'Digite o animal que deseja deletar')
        ]
        # deletar aqui
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação" | "Página Inicial"}

    return answers

def animaisRisco():
    title("Pesquisa de Animais em Risco")
    answers = basicRoutes()
    clear()
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('distância', 'Digite a distância (km) entre a presa e o predador'),
            inquirer.Text('período', message='Digite o período em dias entre a aparição dos dois animais')
        ]
    

if any(x in sys.platform for x in ['darwin', 'linux']):
    # Corrige backspace
    readchar.key.BACKSPACE = '\x7F'

#establishing the connection
conn = psycopg2.connect(
   database="postgres", user='postgres', password='180970', host='127.0.0.1', port='5432'
)
#Creating a cursor object using the cursor() method
cursor = conn.cursor()

#Executing an MYSQL function using the execute() method
cursor.execute("select version()")

# Fetch a single row using fetchone() method.
data = cursor.fetchone()
print("Connection established to: ",data)

file = open(".\sql_dados\consultas.sql")

lines = file.readlines()
lines = [line.rstrip().lstrip() for line in lines]
queries = []
query = []
for line in lines:
    if (line.startswith("--")):
        if (len(query) > 0):
            queries.append(query)
        query = []
    elif (line != ""):
        query.append(line)

for i, q in enumerate(queries):
    queries[i] = ' '.join(q)

prevPage = None
prevPrevPage = None
nextPage = "Página Inicial"

usuario = "Organização"
sair = False
while not sair:
    if nextPage == "Página Inicial":
        # deve-se passar o ID do usuário (variável 'usuario') para a página Inicial
        answers = paginaInicial(usuario)
    elif nextPage == "Identificação":
        answers = identificacao()
    elif nextPage == "Cadastro":
        answers = cadastro()
    elif nextPage == "Busca de Animal":
        answers = buscaAnimal()
    elif nextPage == "Relatos":
        answers = relatos()
    elif nextPage == "Relato":
        answers = relato()
    elif nextPage == "Criar Relato":
        answers = criarRelato()
    elif nextPage == "Criar Alerta":
        answers = criarAlerta()
    elif nextPage == "Ver Alertas":
        answers = verAlertas()
    elif nextPage == "Alerta":
        answers = alerta()
    elif nextPage == "Atualizar Estado":
        answers = atualizarEstado()
    elif nextPage == "Cadastrar Espécime":
        answers = cadastrarEspecime()
    elif nextPage == 'Disponibilizar Apadrinhamento':
        answers = disponibilizar()
    elif nextPage == 'Realizar Consulta':
        answers = consulta()
    elif nextPage == 'Apadrinhar':
        answers = apadrinhar()
    elif nextPage == 'Desapadrinhar':
        answers = desapadrinhar()
    elif nextPage == 'Ver Espécimes':
        answers = verEspecimes()
    elif nextPage == 'Criar Animal':
        answers = criarAnimal()
    elif nextPage == 'Deletar Animal':
        answers = deletarAnimal()
    elif nextPage == 'Pesquisar Animais em Risco':
        answers = animaisRisco()
    elif nextPage == "Sair":
        sair = True
        #Closing the connection
        conn.close()
        
    prevPrevPage = prevPage
    prevPage = nextPage
        
    nextPage = None
    if ("ação" in answers):
        nextPage = answers['ação']

    if (nextPage == "Voltar"):
        nextPage = prevPrevPage
    clear()