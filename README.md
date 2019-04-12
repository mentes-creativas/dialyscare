# dialyscare

Proyecto final de primer año del programa b_IT de Mentes Creativas

## Demo online

https://app.dialyscare.com/

* Usuario: horaciososa
* Clave: 123458

## Requisitos de instalación

1. Python 3.6 o superior
2. Pip (en Windows actualmente viene por defecto con Python, pero sino es el caso: https://pip.pypa.io/en/stable/installing)


## Instalar dependencias

~~~~
pip install -r requirements.txt
~~~~

## Ejecutar aplicación

~~~~
python main.py
~~~~

## Solucionar problemas en Linux

### Problema al instalar dependencias en Ubuntu (y parientes)

Si aparece un error que dice algo así como que no encuentra el driver de MySQL, hay que ejecutar lo siguiente:

~~~~
pip install --upgrade pip
~~~~

~~~~
pip install --upgrade setuptools
~~~~

~~~~
sudo apt-get install python3-dev libmysqlclient-dev
~~~~

### Mismo problema en CentOS (Red Hat y parientes)

~~~~
sudo yum install python36u-devel libmysqlclient16-devel mysql-devel
~~~~

*Nota: Si se está usando un entorno virtual, lo mejor es ejecutar los comandos fuera de él y luego volverlo a crear.*

Más infoción sobre mysqlclient https://pypi.org/project/mysqlclient/

### Problema al ejecutar en modo DEBUG en Linux Mint

Si el error comienza con:

Traceback (most recent call last):
  File "main.py", line 425, in <module>
    app.run(debug=DEBUG, host=HOST, port=PORT)
  ...
  ...

**Cambiar `DEBUG = True` por `DEBUG = False` en config.py**
