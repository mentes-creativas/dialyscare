from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, TextAreaField, DateField, IntegerField, BooleanField, SubmitField
from wtforms.validators import DataRequired, ValidationError, Email, EqualTo, Length, Regexp

import models as m

def user_exists(form, field):
    if m.Usuarios.select().where(m.Usuarios.usuario == field.data).exists():
        raise ValidationError('Ese nombre de usuario ya existe')

def email_exists(form, field):
    if m.Personas.select().where(m.Personas.email == field.data).exists():
        raise ValidationError('Ese mail ya fue registrado')

def ci_exists(form, field):
    if m.Personas.select().where(m.Personas.ci == field.data).exists():
        raise ValidationError('Esa cédula ya está registrada')

class registro_usuario(FlaskForm):
    usuario = StringField(
        'Usuario',
        validators=[
            DataRequired(),
            Regexp(
                r'^[a-zA-Z0-9_]+$'
            ),
            #user_exists
            ])

    email = StringField(
        'Email',
        validators=[
            DataRequired(),
            Email(),
            #email_exists
            ])

    clave = StringField(
        'Contraseña',
        validators = [
            DataRequired(),
            Length(min=4),
           # EqualTo('clave2', message ='Ambas contraseñas deben coinicidir')
        ])

   # clave2 = PasswordField(
      #  'Repita la contraseña',
      #  validators = [DataRequired()])

    nombres = StringField('Nombres',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z]+$'),
            Length(max=45)
            ])

    apellidos = StringField('Apellidos',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z]+$'),
            Length(max=45)
        ])

    ci = IntegerField(
        'C.I.',
        validators = [
            DataRequired(),
            Length(min=8, max=8, message='Sin puntos ni guiones'),
            #ci_exists
        ])

    telefono1 = StringField(
        'Telefono',
        validators= [
            DataRequired(),
            Length(max=20),
            Regexp(r'^[0-9]+$')
            ])

    telefono2 = StringField(
        'Otro Telefono',
        validators= [
            Length(max=20),
            Regexp(r'^[0-9]+$')
            ])

    telefono3 = StringField(
        'Otro Telefono',
        validators= [
            Length(max=20),
            Regexp(r'^[0-9]+$')
            ])

    direccion = StringField('Dirección',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z0-9]+$'),
            ])

    localidad = StringField('Localidad',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z0-9]+$'),
            Length(max=40)
            ])

    departamento = StringField('Departamento',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z]+$'),
            Length(max=40)
            ])

    pais = StringField('País',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z]+$'),
            Length(max=40)
            ])

    fecha_nacimiento = DateField(
        'Fecha de Nacimiento',
        validators = [DataRequired()]
        )

    sexo = StringField('Sexo',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z]+$'),
            Length(max=1)
            ])

    observaciones = TextAreaField('Observaciones')

    estado = BooleanField('Vigente?',
        validators = [DataRequired()])

    rol = StringField('Rol',
        validators=[
            DataRequired(),
            Regexp(r'^[a-zA-Z]+$'),
            Length(max=15)
            ])

    n_d_super = BooleanField('Superusuario?')

    num_prof = StringField('Nro. CJPPU',
        validators=[
            Regexp(r'^[0-9]+$'),
            Length(max=6)
            ])


class pacientes_agregar_editar(FlaskForm):
    nombres = StringField('Nombres', validators=[DataRequired("Debes ingresar al menos un nombre")])
    apellidos = StringField('Apellidos', validators=[DataRequired("Debes ingresar al menos un apellido")])
    ci = IntegerField('C.I.', validators=[DataRequired("Debes ingresar la cédula"), Length(min=8, max=8, message="Solamente números, sin puntos ni guión"), ValidationError("Solamente números, sin puntos ni guión")])
    email = StringField('E-mail', validators=[DataRequired("Debes ingresar un e-mail"), Email("Debes ingresar un e-mail válido")])


class login(FlaskForm):
    usuario = StringField('Usuario', validators=[DataRequired("Debes ingresar un usuario")], render_kw={"placeholder": "Usuario"})
    clave = PasswordField('Contraseña', validators=[DataRequired("Debes ingresar una contraseña")], render_kw={"placeholder": "Contraseña"})
    submit = SubmitField('Ingresar al Sistema')
