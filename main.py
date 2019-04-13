# Primero van los módulos propios de python, después van los de
# terceros que instalamos con pip y por último los nuestros
import json
import datetime
import sys

from flask import Flask, g, flash, render_template, flash, url_for, redirect, request
from flask_bcrypt import check_password_hash
from flask_login import LoginManager, login_user, logout_user, login_required
from playhouse.shortcuts import model_to_dict, dict_to_model

import config
import models
import constants
import forms

app = Flask(__name__)
app.secret_key = '¬€~#@|PrOgRaMaB_It-MeNtEsCrEaTiVas-DiAlYsCaRe|@#~€¬'

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'
login_manager.login_message = 'Debes iniciar sesión'


@login_manager.user_loader
def load_user(userid):
    try:
        return models.Usuarios.get(models.Usuarios.id == userid)
    except models.DoesNotExist:
        return None


@app.before_request
def before_request():
    """Conecta a la base de datos antes de cada request,
    también recupera el nombre del usuario guardado en la
    cookie al iniciar sesión"""
    g.db = models.db
    if g.db.is_closed():
        g.db.connect()

    try:
        data = json.loads(request.cookies.get('userdata'))
    except TypeError:
        g.username = "Desconocido"
    else:
        g.username = data.get('usuario')


@app.after_request
def after_request(response):
    """Cierra la conexión a la base de dato después de cada request"""
    g.db.close()
    return response


@app.route("/", methods = ['GET', 'POST'])
def index():
    return redirect(url_for('login'))


@app.route("/admin", methods = ['GET', 'POST'])
@login_required
def inicio():
    context = {'titulo_de_la_pagina': 'Inicio', 'nombre_de_usuario': g.username}
    return render_template('inicio.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/pacientes/listado", methods = ['GET', 'POST'])
@login_required
def pacientes():
    context = {
            'titulo_de_la_pagina': 'Listado de pacientes',
            'nombre_de_usuario': g.username,
            'pacientes': models.Pacientes.list()
        }
    return render_template('pacientes-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/pacientes/agregar", methods = ['GET', 'POST'])
@login_required
def pacientes_agregar():
    if( request.method == 'POST' ):
        try:
            ci = int(request.formodels.get('ci'))
            email = request.formodels.get('email')

            if( models.Pacientes.check_ci(ci) ):
                raise ValueError('La C.I. ' + str(ci) + ' ya se encuentra registrada')
            elif( models.Pacientes.check_email(email) ):
                raise ValueError('El email ' + email + ' ya se encuentra registrado')
            else:
                nombres = request.formodels.get('nombres')
                apellidos = request.formodels.get('apellidos')
                direccion = request.formodels.get('direccion')
                localidad = request.formodels.get('localidad')
                departamento = request.formodels.get('departamento')
                pais = request.formodels.get('pais')
                telefono1 = request.formodels.get('telefono1')
                telefono2 = request.formodels.get('telefono2')
                telefono3 = request.formodels.get('telefono3')
                fecha_de_nacimiento = datetime.datetime.strptime(request.formodels.get('fecha_de_nacimiento'), '%Y-%m-%d')
                sexo = request.formodels.get('sexo')
                observaciones = request.formodels.get('observaciones')
                doctor_id = int(request.formodels.get('doctor_id'))
                enfermero_id = int(request.formodels.get('enfermero_id'))
                mutualista_id = int(request.formodels.get('mutualista_id'))
                tipo_de_paciente = request.formodels.get('tipo_de_paciente')
                tipo_de_acceso_vascular = request.formodels.get('tipo_de_acceso_vascular')
                numero_fnr = int(request.formodels.get('numero_fnr'))
                estado = bool(request.formodels.get('estado'))
                primer_dialisis = datetime.datetime.strptime(request.formodels.get('primer_dialisis'), '%Y-%m-%d')
                grupo_sanguineo = request.formodels.get('grupo_sanguineo')
                rh = request.formodels.get('rh')
                altura = int(request.formodels.get('altura'))
                hta = bool(request.formodels.get('hta'))
                alergico = bool(request.formodels.get('alergico'))
                diabetico = bool(request.formodels.get('diabetico'))
                habilitar_lavado_capilar = bool(request.formodels.get('habilitar_lavado_capilar'))
                tipo_de_puesto = request.formodels.get('tipo_de_puesto')

                mutualista = models.Mutualistas.get(models.Mutualistas.id == mutualista_id)
                doctor = models.Doctores.get(models.Doctores.id == doctor_id)
                enfermero = models.Enfermeros.get(models.Enfermeros.id == enfermero_id)

                models.Pacientes.create_paciente(nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                    localidad, departamento, pais, fecha_de_nacimiento, sexo, observaciones, estado, mutualista, doctor,
                    enfermero, altura, tipo_de_paciente, tipo_de_acceso_vascular, grupo_sanguineo, rh, primer_dialisis,
                    diabetico, hta, alergico, numero_fnr, habilitar_lavado_capilar, tipo_de_puesto)
        except Exception as e:
            #error = 'Error on line {}'.format(sys.exc_info()[-1].tb_lineno) + ' ' + str(type(e).__name__) + ' ' + str(e)
            error = str(e)
            flash('Ocurrió un error: ' + error, 'error')

            context = {
                'titulo_de_la_pagina': 'Agregar paciente',
                'nombre_de_usuario': g.username,
                'doctores': models.Doctores.list(),
                'enfermeros': models.Enfermeros.list(),
                'mutualistas': models.Mutualistas.list(),
                'tipos_de_pacientes': constants.TIPOS_DE_PACIENTES,
                'tipos_de_accesos_vasculares': constants.TIPOS_DE_ACCESOS_VASCULARES,
                'tipos_de_puestos': constants.TIPOS_DE_PUESTOS
            }

            form_data = dict(request.formodels.items())#;
            context.update(form_data)

            return render_template('pacientes-agregar-editar.html', **context) # doble asterisco desempaqueta las variables en el template
        else:
            flash('¡El paciente ha sido agregado con éxito!', 'ok')
            return redirect(url_for('pacientes'))

    else:
        context = {
            'titulo_de_la_pagina': 'Agregar paciente',
            'nombre_de_usuario': g.username,
            'doctores': models.Doctores.list(),
            'enfermeros': models.Enfermeros.list(),
            'mutualistas': models.Mutualistas.list(),
            'tipos_de_pacientes': constants.TIPOS_DE_PACIENTES,
            'tipos_de_accesos_vasculares': constants.TIPOS_DE_ACCESOS_VASCULARES,
            'tipos_de_puestos': constants.TIPOS_DE_PUESTOS
        }
        return render_template('pacientes-agregar-editar.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/pacientes/editar/<int:paciente_id>", methods = ['GET', 'POST'])
@login_required
def pacientes_editar( paciente_id ):
    try:
        paciente = models.Pacientes.get_by_id(paciente_id)
        persona = paciente.persona
    except:
        flash('Error al recuperar el paciente', 'error')
        return redirect(url_for('pacientes'))
    else:
        if( request.method == 'POST' ):
            try:
                ci = int(request.formodels.get('ci'))
                email = request.formodels.get('email')
                nombres = request.formodels.get('nombres')
                apellidos = request.formodels.get('apellidos')
                direccion = request.formodels.get('direccion')
                localidad = request.formodels.get('localidad')
                departamento = request.formodels.get('departamento')
                pais = request.formodels.get('pais')
                telefono1 = request.formodels.get('telefono1')
                telefono2 = request.formodels.get('telefono2')
                telefono3 = request.formodels.get('telefono3')
                fecha_de_nacimiento = datetime.datetime.strptime(request.formodels.get('fecha_de_nacimiento'), '%Y-%m-%d')
                sexo = request.formodels.get('sexo')
                observaciones = request.formodels.get('observaciones')
                doctor_id = int(request.formodels.get('doctor_id'))
                enfermero_id = int(request.formodels.get('enfermero_id'))
                mutualista_id = int(request.formodels.get('mutualista_id'))
                tipo_de_paciente = request.formodels.get('tipo_de_paciente')
                tipo_de_acceso_vascular = request.formodels.get('tipo_de_acceso_vascular')
                numero_fnr = int(request.formodels.get('numero_fnr'))
                estado = bool(request.formodels.get('estado'))
                primer_dialisis = datetime.datetime.strptime(request.formodels.get('primer_dialisis'), '%Y-%m-%d')
                grupo_sanguineo = request.formodels.get('grupo_sanguineo')
                rh = request.formodels.get('rh')
                altura = int(request.formodels.get('altura'))
                hta = bool(request.formodels.get('hta'))
                alergico = bool(request.formodels.get('alergico'))
                diabetico = bool(request.formodels.get('diabetico'))
                habilitar_lavado_capilar = bool(request.formodels.get('habilitar_lavado_capilar'))
                tipo_de_puesto = request.formodels.get('tipo_de_puesto')

                mutualista = models.Mutualistas.get(models.Mutualistas.id == mutualista_id)
                doctor = models.Doctores.get(models.Doctores.id == doctor_id)
                enfermero = models.Enfermeros.get(models.Enfermeros.id == enfermero_id)

                models.Pacientes.update_paciente(paciente_id, nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                    localidad, departamento, pais, fecha_de_nacimiento, sexo, observaciones, estado, mutualista, doctor,
                    enfermero, altura, tipo_de_paciente, tipo_de_acceso_vascular, grupo_sanguineo, rh, primer_dialisis,
                    diabetico, hta, alergico, numero_fnr, habilitar_lavado_capilar, tipo_de_puesto)
            except Exception as e:
                #error = 'Error on line {}'.format(sys.exc_info()[-1].tb_lineno) + ' ' + str(type(e).__name__) + ' ' + str(e)
                error = str(e)
                flash('Ocurrió un error: ' + error, 'error')

                context = {
                    'titulo_de_la_pagina': 'Editar paciente',
                    'nombre_de_usuario': g.username,
                    'doctores': models.Doctores.list(),
                    'enfermeros': models.Enfermeros.list(),
                    'mutualistas': models.Mutualistas.list(),
                    'tipos_de_pacientes': constants.TIPOS_DE_PACIENTES,
                    'tipos_de_accesos_vasculares': constants.TIPOS_DE_ACCESOS_VASCULARES,
                    'tipos_de_puestos': constants.TIPOS_DE_PUESTOS,
                    'id': paciente_id
                }

                form_data = dict(request.formodels.items())#;
                context.update(form_data)

                return render_template('pacientes-agregar-editar.html', **context) # doble asterisco desempaqueta las variables en el template
            else:
                flash('¡El paciente ha sido editado con éxito!', 'ok')
                return redirect(url_for('pacientes'))
        else:
            context = {
                'titulo_de_la_pagina': 'Editar paciente',
                'nombre_de_usuario': g.username,
                'doctores': models.Doctores.list(),
                'enfermeros': models.Enfermeros.list(),
                'mutualistas': models.Mutualistas.list(),
                'tipos_de_pacientes': constants.TIPOS_DE_PACIENTES,
                'tipos_de_accesos_vasculares': constants.TIPOS_DE_ACCESOS_VASCULARES,
                'tipos_de_puestos': constants.TIPOS_DE_PUESTOS
            }

            persona_data = model_to_dict(persona, recurse=False)

            paciente_data = model_to_dict(paciente, recurse=False)
            paciente_data['mutualista_id'] = paciente_data.pop('mutualista')
            paciente_data['doctor_id'] = paciente_data.pop('doctor')
            paciente_data['enfermero_id'] = paciente_data.pop('enfermero')

            context.update(persona_data)
            context.update(paciente_data)

            return render_template('pacientes-agregar-editar.html', **context)


@app.route("/admin/pacientes/ver/<int:paciente_id>", methods = ['GET'])
@login_required
def pacientes_ver( paciente_id ):
    context = {'titulo_de_la_pagina': 'Ver paciente', 'nombre_de_usuario': g.username}
    return render_template('pacientes-ver.html', **context)


@app.route("/admin/pacientes/evolucion", methods = ['GET', 'POST'])
@app.route("/admin/pacientes/evolucion/<int:paciente_id>", methods = ['GET', 'POST'])
@login_required
def pacientes_evolucion( paciente_id = 0 ):
    context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': g.username}
    return render_template('pacientes-evolucion.html', **context)


@app.route("/admin/pacientes/indicaciones", methods = ['GET'])
@app.route("/admin/pacientes/indicaciones/<int:paciente_id>", methods = ['GET'])
@login_required
def pacientes_indicaciones( paciente_id = 0 ):
    context = {'titulo_de_la_pagina': 'Agregar paciente', 'nombre_de_usuario': g.username}
    return render_template('pacientes-indicaciones.html', **context)


@app.route("/admin/sesiones/listado", methods = ['GET', 'POST'])
@login_required
def sesiones():
    context = {'titulo_de_la_pagina': 'Listado de sesiones', 'nombre_de_usuario': g.username}
    return render_template('sesiones-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/capilares/listado", methods = ['GET', 'POST'])
@login_required
def capilares():
    context = {'titulo_de_la_pagina': 'Listado de capilares', 'nombre_de_usuario': g.username}
    return render_template('capilares-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/usuarios/listado", methods = ['GET', 'POST'])
@login_required
def usuarios():
    context = {
            'titulo_de_la_pagina': 'Listado de usuarios',
            'nombre_de_usuario': g.username,
            'usuarios': models.Usuarios.list()
        }
    return render_template('usuarios-listado.html', **context) # doble asterisco desempaqueta las variables en el template


@app.route("/admin/usuarios/agregar", methods = ['GET', 'POST'])
@login_required
def usuarios_agregar():
    if( request.method == 'POST' ):
        try:
            ci = int(request.formodels.get('ci'))
            email = request.formodels.get('email')
            if( models.Usuarios.check_ci(ci) ):
                raise ValueError('La C.I. ' + str(ci) + ' ya se encuentra registrada')
            elif( models.Usuarios.check_email(email) ):
                raise ValueError('El email ' + email + ' ya se encuentra registrado')
            else:
                nombres = request.formodels.get('nombres')
                apellidos = request.formodels.get('apellidos')
                direccion = request.formodels.get('direccion')
                localidad = request.formodels.get('localidad')
                departamento = request.formodels.get('departamento')
                pais = request.formodels.get('pais')
                telefono1 = request.formodels.get('telefono1')
                telefono2 = request.formodels.get('telefono2')
                telefono3 = request.formodels.get('telefono3')
                fecha_de_nacimiento = datetime.datetime.strptime(request.formodels.get('fecha_de_nacimiento'), '%Y-%m-%d')
                sexo = request.formodels.get('sexo')
                observaciones = request.formodels.get('observaciones')
                estado = bool(request.formodels.get('estado'))
                usuario = request.formodels.get('usuario')
                tipo_de_usuario = request.formodels.get('tipo_de_usuario')
                super_user = bool(request.formodels.get('super_user'))
                clave = request.formodels.get('clave')
                if(tipo_de_usuario == 'administrativo'):
                    models.Administrativos.create_administrativo(nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                    localidad, departamento, pais, fecha_de_nacimiento, sexo, estado, observaciones, usuario, clave)
                elif( tipo_de_usuario == 'enfermero'):
                    models.Enfermeros.create_enfermero(nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                    localidad, departamento, pais, fecha_de_nacimiento, sexo, estado, observaciones, usuario, clave)
                elif( tipo_de_usuario == 'nurse'):
                    models.Nurses.create_nurse(nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                    localidad, departamento, pais, fecha_de_nacimiento, sexo, estado, observaciones, usuario, clave, super_user)
                elif( tipo_de_usuario == 'doctor'):
                    numero_profesional = request.formodels.get('numero_profesional')
                    models.Doctores.create_doctor(nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                    localidad, departamento, pais, fecha_de_nacimiento, sexo, estado, observaciones, usuario, clave,
                    super_user, numero_profesional)
                else:
                    print("usuario tiene rol: ", tipo_de_usuario)
                    pass
        except Exception as e:
            #error = 'Error on line {}'.format(sys.exc_info()[-1].tb_lineno) + ' ' + str(type(e).__name__) + ' ' + str(e)
            error = str(e)
            flash('Ocurrió un error: ' + error, 'error')

            context = {
                'titulo_de_la_pagina': 'Agregar usuario',
                'nombre_de_usuario': g.username,
                'tipos_de_usuarios': constants.TIPOS_DE_USUARIOS
            }

            form_data = dict(request.formodels.items())#;
            context.update(form_data)

            return render_template('usuarios-agregar-editar.html', **context) # doble asterisco desempaqueta las variables en el template
        else:
            flash('¡El usuario ha sido agregado con éxito!', 'ok')
            return redirect(url_for('usuarios'))

    else:
        context = {
            'titulo_de_la_pagina': 'Agregar usuario',
            'nombre_de_usuario': g.username,
            'tipos_de_usuarios': constants.TIPOS_DE_USUARIOS
        }
        return render_template('usuarios-agregar-editar.html', **context)


@app.route("/admin/usuarios/editar/<int:usuario_id>", methods = ['GET', 'POST'])
@login_required
def usuarios_editar( usuario_id ):
    try:
        usuario = models.Usuarios.get_by_id(usuario_id)
        persona = usuario.persona
    except:
        flash('Error al recuperar el usuario', 'error')
        return redirect(url_for('usuarios'))
    else:
        if( request.method == 'POST' ):
            try:
                ci = int(request.formodels.get('ci'))
                email = request.formodels.get('email')
                nombres = request.formodels.get('nombres')
                apellidos = request.formodels.get('apellidos')
                direccion = request.formodels.get('direccion')
                localidad = request.formodels.get('localidad')
                departamento = request.formodels.get('departamento')
                pais = request.formodels.get('pais')
                telefono1 = request.formodels.get('telefono1')
                telefono2 = request.formodels.get('telefono2')
                telefono3 = request.formodels.get('telefono3')
                fecha_de_nacimiento = datetime.datetime.strptime(request.formodels.get('fecha_de_nacimiento'), '%Y-%m-%d')
                sexo = request.formodels.get('sexo')
                observaciones = request.formodels.get('observaciones')
                estado = bool(request.formodels.get('estado'))
                tipo_de_usuario = request.formodels.get('tipo_de_usuario')
                usuario = request.formodels.get('usuario')
                numero_profesional = int(request.formodels.get('numero_profesional'))
                super_user = bool(request.formodels.get('super_user'))
                clave = request.formodels.get('clave')
                models.Usuarios.update_usuario(usuario_id, nombres, apellidos, email, ci, telefono1, telefono2, telefono3, direccion,
                    localidad, departamento, pais, fecha_de_nacimiento, sexo, observaciones, estado, usuario, tipo_de_usuario, clave)
            except Exception as e:
                #error = 'Error on line {}'.format(sys.exc_info()[-1].tb_lineno) + ' ' + str(type(e).__name__) + ' ' + str(e)
                error = str(e)
                flash('Ocurrió un error: ' + error, ' error')

                context = {
                    'titulo_de_la_pagina': 'Editar usuario',
                    'nombre_de_usuario': g.username,
                    'tipos_de_usuarios': constants.TIPOS_DE_USUARIOS,
                    'id': usuario_id
                }

                form_data = dict(request.formodels.items())#;
                context.update(form_data)

                return render_template('usuarios-agregar-editar.html', **context) # doble asterisco desempaqueta las variables en el template
            else:
                flash('¡El usuario ha sido editado con éxito!', 'ok')
                return redirect(url_for('usuarios'))
        else:
            context = {
                'titulo_de_la_pagina': 'Editar usuario',
                'nombre_de_usuario': g.username,
                'tipos_de_usuarios': constants.TIPOS_DE_USUARIOS,
                'id': usuario_id
            }

            persona_data = model_to_dict(persona, recurse=False)

            usuario_data = model_to_dict(usuario, recurse=False)
            usuario_data['rol'] = usuario_data.pop('rol')
            usuario_data['usuario'] = usuario_data.pop('usuario')
            usuario_data['clave'] = usuario_data.pop('clave')

            context.update(persona_data)
            context.update(usuario_data)

            return render_template('usuarios-agregar-editar.html', **context)


@app.route("/logout")
@login_required
def logout():
    logout_user()
    response = redirect(url_for('login'))
    response.delete_cookie('userdata')
    flash("Has cerrado sesión correctamente", 'success')
    return response


@app.route("/login", methods = ['GET', 'POST'])
def login():
    form = forms.login()

    if request.method == "POST":
        if formodels.validate_on_submit():
            try:
                usuario = models.Usuarios.get(models.Usuarios.usuario == formodels.usuario.data)
            except models.DoesNotExist:
                flash("El usuario o la contraseña no son correctos", 'error')
            else:
                if check_password_hash(usuario.clave, formodels.clave.data):
                    login_user(usuario)
                    response = redirect(url_for('inicio'))
                    response.set_cookie('userdata', json.dumps({'usuario': usuario.persona.nombres + ' ' + usuario.persona.apellidos}))
                    return response
                else:
                    flash("El usuario o la contraseña no son correctos", 'error')

    return render_template('login.html', form = form)


if __name__ == '__main__':
    models.initialize()
    app.run(debug=config.DEBUG, host=config.HOST, port=config.PORT)
