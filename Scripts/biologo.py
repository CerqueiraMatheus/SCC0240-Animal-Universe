import inquirer
from inquirer.themes import GreenPassion
from terminal import *
from auxiliar import *

# Cria um alerta com os dados
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

# Cria um animal com os dados
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

# Deleta um animal com os dados
def deletarAnimal():
    title("Deleção de Animais")
    answers = basicRoutes()
    clear()
    
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('animal', 'Digite o animal que deseja deletar')
        ]
        # deletar aqui
        return inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}

    return answers

# Retorna os animais em risco dados parâmetros
def animaisRisco(cursor, consultas):
    title("Pesquisa de Animais em Risco")
    answers = basicRoutes()
    clear()
    if (answers['ação'] == 'Manter'):
        questions = [
            inquirer.Text('distância', 'Digite a distância (km) entre a presa e o predador'),
            inquirer.Text('período', message='Digite o período em dias entre a aparição dos dois animais')
        ]
        answers = inquirer.prompt(questions, theme=GreenPassion()) | {"ação": "Página Inicial"}
        cursor.execute(consultas[0])
        cursor.execute(consultas[1], (int(answers['distância']), int(answers['período'])))
        data = cursor.fetchall()
        if (len(data) == 0):
            print("Nenhum caso encontrado")
        else:
            for tupla in data:
                print(f'''
                      Presa: {tupla[0]},
                      Relato da Presa: {tupla[2]},
                      Predador: {tupla[3]},
                      Relato do Predador: {tupla[5]},
                      Distância: {tupla[6]},
                      Dias entre as aparições: {tupla[7]}''')
        questions = [
            inquirer.Confirm('sair')
        ]
        answers = inquirer.prompt(questions, theme=GreenPassion())
        return {'ação': 'Página Inicial'}
    
    return answers