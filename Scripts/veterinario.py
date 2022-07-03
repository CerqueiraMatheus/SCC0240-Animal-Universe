import inquirer
from inquirer.themes import GreenPassion
from terminal import *
from auxiliar import *

# Cadastra uma consulta
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