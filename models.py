import datetime

from peewee import *

db = MySQLDatabase('bevc2jessjfwwvi2ekjy', # nombre de la base de datos
                   host='bevc2jessjfwwvi2ekjy-mysql.services.clever-cloud.com',
                   user='unrdx4dncf6xxhtq',
                   password='5lYhw5xU96ki5H0p6lmY',
                   port=3306)


class MyModel(Model):  # Con esta clase ya establezco la base de datos que van a usar todos los modelos
    class Meta:
        database = db


class General(MyModel):
    admin_nombre = CharField(max_length=60)
    admin_email = CharField(max_length=60)
    admin_telefono = CharField(max_length=20)
    balanza_clave = IntegerField()

    class Meta:
        table_name = 'general'
        primary_key = False


class Personas(MyModel):
    id = PrimaryKeyField()
    nombres = CharField(max_length=45)
    apellidos = CharField(max_length=45)
    email = CharField(max_length=255, unique=True)
    ci = IntegerField(unique=True)
    telefono1 = CharField(20)
    telefono2 = CharField(20)
    telefono3 = CharField(20)
    direccion = TextField()
    localidad = CharField(40)
    departamento = CharField(40)
    pais = CharField(40)
    fecha_de_nacimiento = DateField()
    sexo = FixedCharField(max_length=1)
    ingreso = DateTimeField(default=datetime.datetime.now())
    #ingreso = TimestampField(default=int(datetime.datetime.now().timestamp()))   otra forma de hacerlo
    observaciones = TextField()
    estado = BooleanField

    class Meta:
        table_name = 'personas'
        


class Usuarios(MyModel):
    id = PrimaryKeyField()
    persona_id = ForeignKeyField(Personas, backref='usuarios', unique=True)
    rol = CharField(max_length=20)
    usuario = CharField(max_length=20, unique=True)
    clave = CharField(66)

    class Meta:
        table_name = 'usuarios'
        indexes = (
        (('id', 'persona_id'), True)
        )


class Mutualistas(MyModel):
    id = PrimaryKeyField()
    nombre = CharField(max_length=45)

    class Meta:
        table_name = 'mutualistas'


class Doctores(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='doctores')
    numero_profesional = IntegerField(unique=True)
    super_doctor = BooleanField(default=False)

    class Meta:
        table_name = 'doctores'
        indexes = (
        (('id', 'usuarios_id'), True)
        )


class Nurses(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='nurses')
    super_nurse = BooleanField(default=False)

    class Meta:
        table_name = 'nurses'
        indexes = (
        (('id', 'usuarios_id'), True)
        )


class Enfermeros(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='enfermeros') 

    class Meta:
        table_name = 'enfermeros'
        indexes = (
        (('id', 'usuarios_id'), True)
        )


class Administrativos(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='administrativos') 

    class Meta:
        table_name = 'administrativos'
        indexes = (
        (('id', 'usuarios_id'), True)
        )


class Pacientes(MyModel):
    id = PrimaryKeyField()
    personas_id = ForeignKeyField(Personas, backref='pacientes', unique=True)
    mutualistas_id = ForeignKeyField(Mutualistas, backref='mutualista', unique=True)
    doctores_id = ForeignKeyField(Doctores, backref='doctores', unique=True)
    enfermeros_id = ForeignKeyField(Enfermeros, backref='enfermeros', unique=True)
    altura = IntegerField()
    tipo_de_paciente = CharField(max_length=20)
    tipo_de_acceso_vascular = CharField(max_length=20)
    grupo_sanguineo = CharField(max_length=2) # (A,B,AB,O)
    rh = FixedCharField(max_length=1) # Positivo='+' Negativo = '-' o rh = FixedCharField(max_length=8)
    primer_dialisis = DateField('%d,%m,%Y')
    diabetico = BooleanField(default=False)
    hta = BooleanField(default=False)
    alergico = BooleanField(default=False)
    numero_fnr = IntegerField()
    habilitar_lavado_capilar = BooleanField()
    
    class Meta:
        table_name = 'pacientes'
        indexes = (
        (('id', 'personas_id', 'mutualistas_id', 'doctores_id', 'enfermeros_id'), True)
        )


if __name__ == '__main__':
    db.connect()
    db.create_tables([General, Personas, Usuarios, Mutualistas, Doctores, Nurses, Enfermeros, Administrativos, Pacientes], safe=True)
    # con safe=True no tira error si la tabla ya fue creada
    db.close()
