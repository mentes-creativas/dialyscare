# DESARROLLO
DEBUG = True # con debug=True no tenemos que reiniciar el servidor para ver los cambios
PORT = 5000  # 5000 para desarrollo | 80 es el puerto por defecto del protocolo http
HOST = '0.0.0.0' # con host='0.0.0.0' permite acceder desde otra máquina al servidor de flask

# PRODUCCIÓN
# DEBUG = False # con debug=True no tenemos que reiniciar el servidor para ver los cambios
# PORT = 5000  # 5000 para desarrollo | 80 es el puerto por defecto del protocolo http
# HOST = '0.0.0.0' # con host='0.0.0.0' permite acceder desde otra máquina al servidor de flask


# DB en Clever Cloud
# DB_NAME = bevc2jessjfwwvi2ekjy'
# DB_HOST = 'bevc2jessjfwwvi2ekjy-mysql.services.clever-cloud.com'
# DB_USER = 'unrdx4dncf6xxhtq'
# DB_PASSWORD = '5lYhw5xU96ki5H0p6lmY'
# DB_PORT = 3306

#DB en servidor de Denry, para que app.dialyscare.com vuele!
DB_NAME = 'dialyscare_app'
DB_HOST = '209.141.40.91'
DB_USER = 'dialyscare_app'
DB_PASSWORD = '2JzfPS1Rlo'
DB_PORT = 3306
