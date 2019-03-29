# dialyscare

Proyecto final de primer año del programa b_IT por Mentes Creativas


# Requisitos

1. Python 3.6^
2. Pip (en Windows actualmente viene por defecto con Python, pero sino es el caso: https://pip.pypa.io/en/stable/installing)


# Instalar dependencias

*pip install -r requirements.txt*


# Ejecución

*python main.py*


# Posibles problemas en Linux

### Problema al intentar instalar flask-myslqdb en Ubuntu (y parientes)

Si aparece un error que dice algo así como que no encuentra el driver de MySQL

Lo que hay que hacer para solucionarlo es:

(En caso de que se haya creado un entorno virtual, primero hay que salir de él y borrarlo. Una vez hecho eso ya se pueden ejecutar los siguientes comandos y luego volver a crear el entorno virtual. Tener cuidado de crear el entorno para la versión correcta de python)

*sudo apt-get install python3.6-dev libmysqlclient-dev*

*pip install --upgrade setuptools*


### Problema al ejecutar en modo DEBUG en Linux Mint

Si el error comienza con:

Traceback (most recent call last):
  File "main.py", line 425, in <module>
    app.run(debug=DEBUG, host=HOST, port=PORT)
  ...
  ...

Cambiar *DEBUG = True* a *False* en main.py
