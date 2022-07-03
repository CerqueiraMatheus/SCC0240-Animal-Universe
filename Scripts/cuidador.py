import inquirer
from inquirer.themes import GreenPassion
from terminal import *
from auxiliar import *

# Atualiza o estado de um espécime
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