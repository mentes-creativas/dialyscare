# Por convención: primero van los módulos propios de python, después van los que
# instalamos y por último los nuestros
import json

from flask import Flask, g, flash, render_template, flash, url_for, redirect, request
from flask_login import LoginManager

import models
import constants


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
    """Conecta a la base de datos antes de cada request"""
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
        data = json.loads(request.cookies.get('userdata'))
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
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {
            'titulo_de_la_pagina': 'Listado de pacientes',
            'nombre_de_usuario': nombre,
            'pacientes': models.Pacientes.list()
        }
        return render_template('pacientes-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/pacientes/agregar", methods = ['GET', 'POST'])
def pacientes_agregar():
    try:
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        if( request.method == 'POST' ):
            try:
                ci = request.form.get('ci')

                if( Pacientes.check_paciente_ci(ci) ):
                    flash('El paciente ya existe', 'error')
                    return redirect(url_for('pacientes'))
                else:
                    nombres = request.form.get('nombres')
                    apellidos = request.form.get('apellidos')
                    email = request.form.get('email')
                    direccion = request.form.get('direccion')
                    localidad = request.form.get('localidad')
                    departamento = request.form.get('departamento')
                    pais = request.form.get('pais')
                    telefono1 = request.form.get('telefono1')
                    telefono2 = request.form.get('telefono2')
                    telefono3 = request.form.get('telefono3')
                    fecha_de_nacimiento = request.form.get('fecha_de_nacimiento')
                    print(fecha_de_nacimiento)
                    sexo = request.form.get('sexo')
                    observaciones = request.form.get('observaciones')
                    doctor_id = int(request.form.get('doctor_id'))
                    enfermero_id = int(request.form.get('enfermero_id'))
                    mutualista_id = int(request.form.get('mutualista_id'))
                    tipo_de_paciente = request.form.get('tipo_de_paciente')
                    numero_fnr = request.form.get('numero_fnr')
                    estado = int(request.form.get('estado'))
                    primer_dialisis = request.form.get('primer_dialisis')
                    grupo_sanguineo = request.form.get('grupo_sanguineo')
                    rh = request.form.get('rh')
                    altura = int(request.form.get('altura'))
                    hta = int(request.form.get('hta'))
                    alergico = int(request.form.get('alergico'))
                    diabetico = int(request.form.get('diabetico'))
                    habilitar_lavado_capilar = int(request.form.get('habilitar_lavado_capilar'))
                    tipo_de_puesto = request.form.get('tipo_de_puesto')

                    mutualista = models.Mutualistas.get(models.Mutualistas.id == mutualista_id)
                    doctor = models.Doctores.get(models.Doctores.id == doctor_id)
                    enfermero = models.Enfermeros.get(models.Enfermeros.id == enfermero_id)

                    models.Pacientes.create_paciente(nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                        localidad, departamento, pais, fecha_de_nacimiento, sexo, observaciones, estado, mutualista, doctor,
                        enfermero, altura, tipo_de_paciente, tipo_de_acceso_vascular, grupo_sanguineo, rh, primer_dialisis,
                        diabetico, hta, alergico, numero_fnr, habilitar_lavado_capilar)
            except:
                flash('Ocurrió un error al intentar ingresar el paciente', 'error')
                return redirect(url_for('pacientes_agregar'))
            else:
                flash('¡El paciente ha sido agregado con éxito!', 'ok')
                return redirect(url_for('pacientes'))

        else:
            nombre = data.get('usuario')
            context = {
                'titulo_de_la_pagina': 'Agregar paciente',
                'nombre_de_usuario': nombre,
                'doctores': models.Doctores.list(),
                'enfermeros': models.Enfermeros.list(),
                'mutualistas': models.Mutualistas.list()
            }
            return render_template('pacientes-agregar.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/pacientes/ver/<int:paciente_id>", methods = ['GET'])
def pacientes_ver():
    try:
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-ver.html', **context)


@app.route("/admin/pacientes/editar/<int:paciente_id>", methods = ['GET', 'POST'])
def pacientes_editar():
    try:
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-editar.html', **context)


@app.route("/admin/pacientes/evolucion", methods = ['GET', 'POST'])
@app.route("/admin/pacientes/evolucion/<int:paciente_id>", methods = ['GET', 'POST'])
def pacientes_evolucion():
    try:
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': nombre}
        return render_template('pacientes-evolucion.html', **context)

@app.route("/admin/pacientes/indicaciones", methods = ['GET'])
@app.route("/admin/pacientes/indicaciones/<int:paciente_id>", methods = ['GET'])
def pacientes_indicaciones():
    try:
        data = json.loads(request.cookies.get('userdata'))
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
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {
            'titulo_de_la_pagina': 'Listado de usuarios',
            'nombre_de_usuario': nombre,
            'usuarios': models.Usuarios.list()
        }
        return render_template('usuarios-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/usuarios/agregar", methods = ['GET', 'POST'])
def usuarios_agregar():
    try:
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        response = redirect(url_for('index'))
        return response
    else:
        nombre = data.get('usuario')
        context = {'titulo_de_la_pagina': 'Agregar usuario', 'nombre_de_usuario': nombre}

        return render_template('usuarios-agregar.html', **context ) # doble asterisco desempaqueta las variables en el template


@app.route("/logout", methods = ['GET', 'POST'])
def logout():
    response = redirect(url_for('index'))
    response.delete_cookie('userdata')
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
            response.set_cookie('userdata', json.dumps(dict(request.form.items())))

        return response

        #tambien podia ser asi
        #usuario = request.form["usuario"]
        #contrasena = request.form["contrasena"]
        #return 'El usuario ingresado es {} y la contraseña {}'.format(usuario, contrasena)


if __name__ == '__main__':
    models.initialize()
    app.run(debug=DEBUG, host=HOST, port=PORT)
