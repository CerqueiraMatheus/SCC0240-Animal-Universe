import psycopg2
import os
import sys, readchar
from auxiliar import *
from usuario import *
from biologo import *
from cuidador import *
from gestor import *
from organizacao import *
from veterinario import *

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

if os.name == 'nt':
    consultas = getQueries("..\sql_dados\consultas.sql")
    insercoes = getQueries("..\sql_dados\insercao.sql")
else:
    consultas = getQueries("../sql_dados/consultas.sql")
    insercoes = getQueries("../sql_dados/insercao.sql")

prevPage = None
prevPrevPage = None
nextPage = "Página Inicial"

usuario = "Biólogo"
sair = False
while not sair:
    if nextPage == "Página Inicial":
        # deve-se passar o ID do usuário (variável 'usuario') para a página Inicial
        answers = paginaInicial(usuario)
    elif nextPage == "Identificação":
        answers = identificacao()
    elif nextPage == "Cadastro":
        answers = cadastro(cursor, insercoes, conn)
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
        answers = animaisRisco(cursor, consultas)
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