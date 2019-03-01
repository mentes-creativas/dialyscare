import datetime

from peewee import *

db = MySQLDatabase('bevc2jessjfwwvi2ekjy', # nombre de la base de datos
                   host='bevc2jessjfwwvi2ekjy-mysql.services.clever-cloud.com',
                   user='unrdx4dncf6xxhtq',
                   password='5lYhw5xU96ki5H0p6lmY',
                   port=3306)


class General(Model):
    admin_nombre = CharField(max_length=60)
    admin_email = CharField(max_length=60)
    admin_telefono = CharField(max_length=20)
    balanza_clave = IntegerField()

    class Meta:
        database = db
        table_name = 'general'
        primary_key = False


class Personas(Model):
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
        database = db
        table_name = 'personas'


class Usuarios(Model):
    id = PrimaryKeyField()
    persona = ForeignKeyField(Personas, backref='usuarios', related_name='usuarios', unique=True)
    rol = CharField(max_length=20)
    usuario = CharField(max_length=20, unique=True)
    clave = CharField(66)

    class Meta:
        database = db
        table_name = 'usuarios'


if __name__ == '__main__':
    db.connect()
    db.create_tables([General, Personas, Usuarios], safe=True)  # con safe=True no tira error si la tabla ya fue creada