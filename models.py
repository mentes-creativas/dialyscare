import datetime

from flask import Flask
from flask_login import UserMixin
from flask_bcrypt import generate_password_hash, check_password_hash
from peewee import *

# Print all queries to stderr.
# import logging
# logger = logging.getLogger('peewee')
# logger.addHandler(logging.StreamHandler())
# logger.setLevel(logging.DEBUG)

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

    @classmethod
    def default_data(cls):
        """Agregar datos por defecto"""
        data_source = {'admin_nombre': 'Denry Techera',
                'admin_email': 'denrytech@gmail.com',
                'admin_telefono': '091243955',
                'balanza_clave': 918273}

        cls.create(**data_source)


class Personas(MyModel):
    id = PrimaryKeyField()
    nombres = CharField(max_length=45)
    apellidos = CharField(max_length=45)
    email = CharField(max_length=255, unique=True)
    ci = IntegerField(unique=True)
    telefono1 = CharField(20)
    telefono2 = CharField(null=True, max_length=20)
    telefono3 = CharField(null=True, max_length=20)
    direccion = TextField()
    localidad = CharField(40)
    departamento = CharField(40)
    pais = CharField(40)
    fecha_de_nacimiento = DateField()
    sexo = FixedCharField(max_length=1)
    ingreso = DateTimeField(default=datetime.datetime.now())
    #ingreso = TimestampField(default=int(datetime.datetime.now().timestamp()))   otra forma de hacerlo
    observaciones = TextField(null = True)
    estado = BooleanField()

    class Meta:
        table_name = 'personas'

    @classmethod
    def create_persona(cls, nombres, apellidos, email, ci, telefono1, telefono2,
                        telefono3, direccion, localidad, departamento,
                        pais, fecha_de_nacimiento, sexo, observaciones = '',
                        estado = True):
        try:
            persona = cls.create(
                nombres = nombres,
                apellidos = apellidos,
                email = email,
                ci = ci,
                telefono1 = telefono1,
                telefono2 = telefono2,
                telefono3 = telefono3,
                direccion = direccion,
                localidad = localidad,
                departamento = departamento,
                pais = pais,
                fecha_de_nacimiento = fecha_de_nacimiento,
                sexo = sexo,
                observaciones = observaciones,
                estado = estado
            )

            return persona
        except IntegrityError:
            raise ValueError('La persona ya existe')


class Usuarios(UserMixin, MyModel):
    id = PrimaryKeyField()
    persona = ForeignKeyField(Personas, backref='usuario', unique=True)
    rol = CharField(max_length=20)
    usuario = CharField(max_length=20, unique=True)
    clave = CharField(66)

    class Meta:
        table_name = 'usuarios'

    @classmethod
    def create_usuario(cls, p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
        p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
        p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, u_rol, u_usuario,
        u_clave, n_d_super=False, d_numero_profesional=''):

        try:
            persona = Personas.create_persona(p_nombres, p_apellidos, p_email,
                p_ci, p_telefono1, p_telefono2, p_telefono3, p_direccion, p_localidad,
                p_departamento, p_pais, p_fecha_de_nacimiento, p_sexo, p_observaciones,
                p_estado)

            usuario = cls.create(
                persona = persona,
                rol = u_rol,
                usuario = u_usuario,
                clave = generate_password_hash(u_clave)
            )

            return usuario

        except IntegrityError:
            raise ValueError('El usuario ya existe')

    @classmethod
    def check_usuario_email(cls, email):
        try:
            persona = Personas.get(Personas.email == email)
        except:
            return False
        else:
            return True

    @classmethod
    def check_usuario_ci(cls, ci):
        try:
            persona = Personas.get(Personas.ci == ci)
            print(persona)
        except:
            return False
        else:
            return True

    @classmethod
    def list( cls ):
        query = cls.select().join(Personas).order_by(Personas.nombres)
        return query


class Doctores(MyModel):
    id = PrimaryKeyField()
    usuario = ForeignKeyField(Usuarios, backref='doctor', unique=True)
    numero_profesional = IntegerField(unique=True)
    super_doctor = BooleanField(default=False)

    class Meta:
        table_name = 'doctores'

    @classmethod
    def create_doctor(cls, p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
        p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
        p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, u_usuario,
        u_clave, super_doctor, numero_profesional):
        try:
            usuario = Usuarios.create_usuario(p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
                p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
                p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, 'doctor', u_usuario,
                u_clave, super_doctor, numero_profesional)

            doctor = cls.create(
                usuario = usuario,
                numero_profesional = numero_profesional,
                super_doctor = super_doctor
            )

            return doctor
        except IntegrityError:
            raise ValueError('El doctor ya existe')

    @classmethod
    def list( cls ):
        return cls.select()


class Nurses(MyModel):
    id = PrimaryKeyField()
    usuario = ForeignKeyField(Usuarios, backref='nurse')
    super_nurse = BooleanField(default=False)

    class Meta:
        table_name = 'nurses'

    @classmethod
    def create_nurse(cls, p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
        p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
        p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, u_usuario,
        u_clave, super_nurse = False):
        try:
            usuario = Usuarios.create_usuario(p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
                p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
                p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, 'nurse', u_usuario,
                u_clave, super_nurse)

            nurse = cls.create(
                usuario = usuario,
                super_nurse = super_nurse
            )

            return nurse
        except IntegrityError:
            raise ValueError('El nurse ya existe')

    @classmethod
    def list( cls ):
        return cls.select()


class Enfermeros(MyModel):
    id = PrimaryKeyField()
    usuario = ForeignKeyField(Usuarios, backref='enfermero', unique=True)

    class Meta:
        table_name = 'enfermeros'

    @classmethod
    def create_enfermero(cls, p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
        p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
        p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, u_usuario,
        u_clave):
        try:
            usuario = Usuarios.create_usuario(p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
                p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
                p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, 'enfermero', u_usuario,
                u_clave)

            enfermero = cls.create(
                usuario = usuario,
            )

            return enfermero
        except IntegrityError:
            raise ValueError('El enfermero ya existe')

    @classmethod
    def list( cls ):
        return cls.select()


class Administrativos(MyModel):
    id = PrimaryKeyField()
    usuario = ForeignKeyField(Usuarios, backref='administrativo')

    class Meta:
        table_name = 'administrativos'

    @classmethod
    def create_administrativo(cls, p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
        p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
        p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, u_usuario,
        u_clave):
        try:
            usuario = Usuarios.create_usuario(p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
                p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
                p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, 'administrativo', u_usuario,
                u_clave)

            administrativo = cls.create(
                usuario = usuario,
            )

            return administrativo
        except IntegrityError:
            raise ValueError('El administrativo ya existe')

    @classmethod
    def list( cls ):
        return cls.select()


class Mutualistas(MyModel):
    id = PrimaryKeyField()
    nombre = CharField(max_length=45)

    class Meta:
        table_name = 'mutualistas'

    @classmethod
    def check_mutualista_exists(cls, nombre):
        try:
            mutualista = cls.get(cls.nombre == nombre)
        except:
            return False
        else:
            return True

    @classmethod
    def list( cls ):
        return cls.select()


class Pacientes(MyModel):
    id = PrimaryKeyField()
    persona = ForeignKeyField(Personas, backref='paciente', unique=True)
    mutualista = ForeignKeyField(Mutualistas, backref='paciente')
    doctor = ForeignKeyField(Doctores, backref='paciente')
    enfermero = ForeignKeyField(Enfermeros, backref='paciente')
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
    tipo_de_puesto = CharField(max_length=10)

    class Meta:
        table_name = 'pacientes'

    @classmethod
    def create_paciente(cls, p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
        p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
        p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, mutualista,
        doctor, enfermero, altura, tipo_de_paciente, tipo_de_acceso_vascular,
        grupo_sanguineo, rh, primer_dialisis, diabetico, hta, alergico, numero_fnr,
        habilitar_lavado_capilar, tipo_de_puesto ):

        try:
            persona = Personas.create_persona(p_nombres, p_apellidos, p_email,
                p_ci, p_telefono1, p_telefono2, p_telefono3, p_direccion, p_localidad,
                p_departamento, p_pais, p_fecha_de_nacimiento, p_sexo, p_observaciones,
                p_estado)

            paciente = cls.create(
                persona = persona,
                mutualista = mutualista,
                doctor = doctor,
                enfermero = enfermero,
                altura = altura,
                tipo_de_paciente = tipo_de_paciente,
                tipo_de_acceso_vascular = tipo_de_acceso_vascular,
                grupo_sanguineo = grupo_sanguineo,
                rh = rh,
                primer_dialisis = primer_dialisis,
                diabetico = diabetico,
                hta = hta,
                alergico = alergico,
                numero_fnr = numero_fnr,
                habilitar_lavado_capilar = habilitar_lavado_capilar,
                tipo_de_puesto = tipo_de_puesto
            )

            return paciente

        except IntegrityError:
            raise ValueError('El paciente ya existe')

    @classmethod
    def check_paciente_ci(cls, ci):
        try:
            persona = Personas.get(Personas.ci == ci)
            print(persona)
        except:
            return False
        else:
            return True

    @classmethod
    def list( cls ):
        query = cls.select().join(Personas).order_by(Personas.nombres)
        return query

def initialize():
    db.connect()
    db.create_tables([General, Personas, Usuarios, Mutualistas, Doctores, Nurses,
        Enfermeros, Administrativos, Pacientes], safe=True)
    db.close()



if __name__ == '__main__':
    db.connect()
    db.create_tables([General, Personas, Usuarios, Mutualistas, Doctores, Nurses,
        Enfermeros, Administrativos, Pacientes], safe=True)
    # con safe=True no tira error si la tabla ya fue creada

    #Si no existe configuracion general, agregamos la por defecto
    if( General.select().count() == 0 ):
        General.default_data()

    ##Insertar datos de ejemplo

    ##Crear nurse en jefe
    if( Usuarios.check_usuario_ci(1234560) ):
        print('Horacio Sosa ya existe')
    else:
        nurse = Nurses.create_nurse(
            'Horacio',
            'Sosa',
            'horaciososa1@comero.com.uy',
            1234560,
            '091111111',
            'sin 2º telefono',
            'sin 3er telefono',
            'Ituzaingó 1234',
            'Rocha',
            'Rocha',
            'Uruguay',
            datetime.datetime.strptime('Jun 1 1965', '%b %d %Y'),
            'm',
            'Sin observaciones',
            True,
            'horaciososa',
            '123458',
            True
        )

        print('Horacio Sosa fue agregado con éxito')

    ##Crear doctora en jefe
    if( Usuarios.check_usuario_ci(2345678) ):
        doctor = Usuarios.get(Usuarios.usuario == 'deliapereyra').doctor
        print('Delia Pereyra ya existe')
    else:
        doctor = Doctores.create_doctor(
            'Delia',
            'Pereyra',
            'deliapereyra@comero.com.uy',
            2345678,
            '092222222',
            'sin 2º telefono',
            'sin 3er telefono',
            'General Artigas 1234',
            'Rocha',
            'Rocha',
            'Uruguay',
            datetime.datetime.strptime('Nov 3 1955', '%b %d %Y'),
            'f',
            'Sin observaciones',
            True,
            'deliapereyra',
            '654321',
            True,
            1234
        )

        print('Delia Pereyra fue agregada con éxito')

    ##Crear enfermera
    if( Usuarios.check_usuario_ci(3456789) ):
        enfermero = Usuarios.get(Usuarios.usuario == 'bettinarey').enfermero
        print('Bettina Rey ya existe')
    else:
        enfermero = Enfermeros.create_enfermero(
            'Bettina',
            'Rey',
            'bettinarey@comero.com.uy',
            3456789,
            '093333333',
            'sin 2º telefono',
            'sin 3er telefono',
            'Martinez Rodriguez 1234',
            'Rocha',
            'Rocha',
            'Uruguay',
            datetime.datetime.strptime('Jan 3 1945', '%b %d %Y'),
            'f',
            'Sin observaciones',
            True,
            'bettinarey',
            '123456'
        )

        print('Bettina Rey fue agregada con éxito')

    ##Crear mutualistas
    if( Mutualistas.check_mutualista_exists('ASSE') is False ):
        mutualista = Mutualistas.create(nombre = 'ASSE')

    if( Mutualistas.check_mutualista_exists('COMERO') is False ):
        Mutualistas.create(nombre = 'COMERO')

    if( Mutualistas.check_mutualista_exists('Médica Uruguaya') is False ):
        Mutualistas.create(nombre = 'Médica Uruguaya')

    ##Crear paciente
    if( Pacientes.check_paciente_ci(46944360) ):
        print('Denry Techera ya existe')
    else:
        paciente = Pacientes.create_paciente(
            'Denry',
            'Techera',
            'denrytech@gmail.com',
            46944361,
            '091243955',
            'sin 2º telefono',
            'sin 3er telefono',
            'Eliseo Marzol 1234',
            'Rocha',
            'Rocha',
            'Uruguay',
            datetime.datetime.strptime('Feb 9 1985', '%b %d %Y'),
            'm',
            'Sin observaciones',
            True,
            'COMERO',
            'Cecilia Tognola',
            'Bettina Rey',
            182,
            'ambulatorio',
            'fistula_nativa',
            'b',
            '+',
            datetime.datetime.strptime('Jul 9 2008', '%b %d %Y'),
            False,
            True,
            True,
            211076,
            True,
            'Normal'
        )

        print('Denry Techera fue agregado con éxito')

    db.close()
