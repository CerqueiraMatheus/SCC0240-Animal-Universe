from auxiliar import *
from time import sleep

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