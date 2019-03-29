# dialyscare

Proyecto final de primer año del programa b_IT por Mentes Creativas

---
# Requisitos

1. Python 3.6^
2. Pip (en Windows actualmente se instala por defecto a partir de Python 3.6, pero sino... https://pip.pypa.io/en/stable/installing)

---
# Instalar dependencias

*pip install -r requirements.txt*

---
# Ejecución

*python main.py*

---
# Posibles problemas en Linux

### Problema al intentar instalar flask-myslqdb en Ubuntu (y parientes)

Si aparece un error que dice algo así como que no encuentra el driver de MySQL

Lo que hay que hacer para solucionarlo es:

*sudo apt-get install python3.6-dev libmysqlclient-dev*

Si se había creado un entorno virtual, borrarlo y crearlo devuelta

*pip install --upgrade setuptools*

### Problema al ejecutar en modo DEBUG en Linux Mint

Si el error comienza con:

Traceback (most recent call last):
  File "main.py", line 425, in <module>
    app.run(debug=DEBUG, host=HOST, port=PORT)
  ...
  ...

Cambiar DEBUG = True a False en main.py
