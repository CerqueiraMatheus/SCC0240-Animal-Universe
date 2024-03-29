import os
from terminal import *
import inquirer
from inquirer.themes import GreenPassion

# Limpa a tela
def clear():
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')
        
# Retorna queries
def getQueries(path):
    consultas = open(path)

    lines = consultas.readlines()
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
      
    return queries  
        
# Título de página
def title(text):
    s = Color(text)
    print(s.green_bg.white.underline)
        
# Rotas
def basicRoutes():
    questions = [
            inquirer.List('ação',
                        message='Selecione uma ação',
                        choices=['Manter',
                                 'Voltar',
                                'Página Inicial'])
    ]
    return inquirer.prompt(questions, theme=GreenPassion())