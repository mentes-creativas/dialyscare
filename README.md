# dialyscare

Proyecto final de primer año del programa b_IT de Mentes Creativas

## Demo online

http://app.dialyscare.com/

Aún no valida datos de acceso, se accede ingresando cualquier usuario y contraseña.

En ocasiones da error de conexión, hay que actualizar varias veces para que cargue.

## Requisitos de instalación

1. Python 3.6 o superior
2. Pip (en Windows actualmente viene por defecto con Python, pero sino es el caso: https://pip.pypa.io/en/stable/installing)


## Instalar dependencias

~~~~
pip install -r requirements.txt
~~~~

## Ejecucar aplicación
	
~~~~
python main.py
~~~~

## Solucionar problemas en Linux

### Problema al instalar dependecias en Ubuntu (y parientes)

Si aparece un error que dice algo así como que no encuentra el driver de MySQL

Lo que hay que hacer para solucionarlo es:

*Nota: En caso de que se haya creado un entorno virtual, primero hay que salir de él y borrarlo. Una vez hecho eso ya se pueden ejecutar los siguientes comandos y luego volver a crear el entorno virtual. Tener cuidado de crear el entorno para la versión correcta de python*

~~~~
pip install --upgrade pip
~~~~

~~~~
pip install --upgrade setuptools
~~~~

~~~~
sudo apt-get install python3-dev libmysqlclient-dev
~~~~

Más info https://pypi.org/project/mysqlclient/

### Problema al ejecutar en modo DEBUG en Linux Mint

Si el error comienza con:

Traceback (most recent call last):
  File "main.py", line 425, in <module>
    app.run(debug=DEBUG, host=HOST, port=PORT)
  ...
  ...

**Cambiar `DEBUG = True` por `DEBUG = False` en main.py**
