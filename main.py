import json

from flask import Flask, render_template, url_for, redirect, request

app = Flask(__name__)


@app.route("/", methods = ['GET', 'POST'])
def index():
    return render_template('login.html')


@app.route("/admin", methods = ['GET', 'POST'])
def inicio():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Inicio', 'nombre_de_usuario': nombre}
        return render_template('inicio.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/pacientes/listado", methods = ['GET', 'POST'])
def pacientes():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Listado de pacientes', 'nombre_de_usuario': nombre}
        return render_template('pacientes-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/logout", methods = ['GET', 'POST'])
def logout():
    response = redirect(url_for('index'))
    response.set_cookie('session', '', expires=0)
    return response


@app.route("/login", methods = ['GET', 'POST'])
def login():
    if request.method == "GET":
        response = redirect(url_for('index'))
        return response
    else:
        form = dict(request.form.items())

        if not form['usuario']:
            response = 'Debes ingresar un usuario! <a href="javascript:history.go(-1)">Volver a intentar</a>'
        elif not form['contrasena']:
            response = 'Hola ' + form['usuario'] + ', no olvides ingresar tu contraseña! <a href="javascript:history.go(-1)">Volver a intentar</a>'
        else:
            #response = 'Usuario: {}<br>Contraseña: {}<br><br>^_^'.format(form['usuario'], form['contrasena'])
            response = redirect(url_for('inicio'))
            response.set_cookie('session', json.dumps(dict(request.form.items())))

        return response
        
        #tambien podia ser asi
        #usuario = request.form["usuario"]
        #contrasena = request.form["contrasena"]
        #return 'El usuario ingresado es {} y la contraseña {}'.format(usuario, contrasena)


if __name__ == '__main__':
    # con debug=True no tenemos que reiniciar el servidor para ver los cambios
    # con host='0.0.0.0' permite acceder desde otra máquina al servidor de flask
    app.run(debug=True, host='0.0.0.0')