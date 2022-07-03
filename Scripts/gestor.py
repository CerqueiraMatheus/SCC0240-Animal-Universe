import inquirer
from inquirer.themes import GreenPassion
from terminal import *
from auxiliar import *


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