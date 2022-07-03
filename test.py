import psycopg2

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

# file = open(".\sql_dados\consultas.sql", "r")

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

print(len(queries))

cursor.execute(queries[0])
cursor.execute(queries[1], (1000, 30))
data = cursor.fetchall()
print(data)

#Closing the connection
conn.close()