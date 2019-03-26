import json

import models

import forms

from flask import (Flask, g, render_template, flash, url_for, redirect, request)

from flask_login import LoginManager


DEBUG = True # con debug=True no tenemos que reiniciar el servidor para ver los cambios
PORT = 5000  # 5000 para desarrollo | 80 es el puerto por defecto del protocolo http
HOST = '0.0.0.0' # con host='0.0.0.0' permite acceder desde otra máquina al servidor de flask


app = Flask(__name__)
app.secret_key = '¬€~#@|PrOgRaMaB_It-MeNtEsCrEaTiVas-DiAlYsCaRe|@#~€¬'


login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'


@login_manager.user_loader
def load_user(userid):
    try:
        return models.Usuarios.get(models.Usuarios.id == userid)
    except models.DoesNotExist:
        return None


@app.before_request
def before_request():
    #Conecta a la base de datos antes de cada request
    g.db = models.db
    if g.db.is_closed():
        g.db.connect()
    


@app.after_request
def after_request(response):
    """Cerramos la conección a la base de datos"""
    g.db.close()
    return response



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


@app.route("/admin/pacientes/agregar", methods = ['GET', 'POST'])
def pacientes_agregar():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-agregar.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/pacientes/ver", methods = ['GET', 'POST'])
def pacientes_ver():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-ver.html', **context)


@app.route("/admin/pacientes/editar", methods = ['GET', 'POST'])
def pacientes_editar():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-editar.html', **context)


@app.route("/admin/pacientes/evolucion", methods = ['GET', 'POST'])
def pacientes_evolucion():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-evolucion.html', **context)


@app.route("/admin/pacientes/indicaciones", methods = ['GET', 'POST'])
def pacientes_indicaciones():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-indicaciones.html', **context)


@app.route("/admin/usuarios/listado", methods = ['GET', 'POST'])
def usuarios():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Listado de usuarios', 'nombre_de_usuario': nombre}
        return render_template('usuarios-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/usuarios/agregar", methods = ['GET', 'POST']) 
def usuarios_agregar():
    try:
        data = json.loads(request.cookies.get('session'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar usuario', 'nombre_de_usuario': nombre}
        form = forms.registro_usuario()
        print(form)
        if form.validate_on_submit():
            print('Usuario validado')
            models.Usuarios.create_usuario(
                p_nombres = form.nombres.data,
                p_apellidos = form.apellidos.data,
                p_email = form.email.data,
                p_ci = form.ci.data,
                p_telefono1 = form.telefono1.data,
                p_telefono2 = form.telefono2.data,
                p_telefono3 = form.telefono3.data,
                p_direccion = form.direccion.data,
                p_localidad = form.localidad.data,
                p_departamento = form.departamento.data,
                p_pais = form.pais.data,
                p_fecha_de_nacimiento = form.fecha_nacimiento.data,
                p_sexo = form.sexo.data,
                p_observaciones = form.observaciones.data,
                p_estado = form.estado.data,
                u_rol = form.rol.data,
                u_usuario = form.usuario.data,
                u_clave = form.clave.data,
                n_d_super = form.n_d_super.data,
                d_numero_profesional = form.num_prof.data
                )
            return render_template('usuarios-listado.html', **context)
        return render_template('usuarios-agregar.html', form = form, **context ) # doble asterisco desempaqueta las variables en el template

@app.route("/logout", methods = ['GET', 'POST'])
def logout():
    response = redirect(url_for('index'))
    response.delete_cookie('session')
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
    models.initialize()
    app.run(debug=DEBUG, host=HOST, port=PORT)
