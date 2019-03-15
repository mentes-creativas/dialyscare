import datetime

from flask import Flask
from flask_login import UserMixin
from flask_bcrypt import generate_password_hash, check_password_hash
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
            raise ValueError('Person already exists')


class Usuarios(UserMixin, MyModel):
    id = PrimaryKeyField()
    personas_id = ForeignKeyField(Personas, backref='usuarios', unique=True)
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
                p_ci, p_telefono1, p_telefono2, p_apellidos, p_direccion, p_localidad,
                p_departamento, p_pais, p_fecha_de_nacimiento, p_sexo, p_observaciones,
                p_estado)

            usuario = cls.create(
                personas_id = persona,
                rol = u_rol,
                usuario = u_usuario,
                clave = generate_password_hash(u_clave)
            )

            if( u_rol == 'nurse'):
                nurse = Nurses.create_nurse(usuario, n_d_super)

            elif( u_rol == 'doctor'):
                doctor = Doctores.create_doctor(usuario, d_numero_profesional,
                                                n_d_super)
            
            elif( u_rol == 'enfermero' ):
                enfermero = Enfermeros.create_enfermero(usuario)
            
            elif( u_rol == 'administrativo' ):
                enfermero = Administrativos.create_administrativo(usuario)
            
            else:
                pass

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
        except:
            return False
        else:
            return True


class Doctores(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='doctores', unique=True)
    numero_profesional = IntegerField(unique=True)
    super_doctor = BooleanField(default=False)

    class Meta:
        table_name = 'doctores'

    @classmethod
    def create_doctor(cls, usuario, numero_profesional, super_nurse):
        try:
            doctor = cls.create(
                usuarios_id = usuario,
                numero_profesional = numero_profesional,
                super_nurse = super_nurse
            )

            return doctor
        except IntegrityError:
            raise ValueError('El doctor ya existe')


class Nurses(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='nurses')
    super_nurse = BooleanField(default=False)

    class Meta:
        table_name = 'nurses'

    @classmethod
    def create_nurse(cls, usuario, super_nurse):
        try:
            nurse = cls.create(
                usuarios_id = usuario,
                super_nurse = super_nurse
            )

            return nurse
        except IntegrityError:
            raise ValueError('El nurse ya existe')


class Enfermeros(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='enfermeros', unique=True)

    class Meta:
        table_name = 'enfermeros'
    
    @classmethod
    def create_enfermero(cls, usuario):
        try:
            enfermero = cls.create(
                usuarios_id = usuario,
            )

            return enfermero
        except IntegrityError:
            raise ValueError('El enfermero ya existe')


class Administrativos(MyModel):
    id = PrimaryKeyField()
    usuarios_id = ForeignKeyField(Usuarios, backref='administrativos')

    class Meta:
        table_name = 'administrativos'
    
     @classmethod
    def create_administrativo(cls, usuario):
        try:
            administrativo = cls.create(
                usuarios_id = usuario,
            )

            return administrativo
        except IntegrityError:
            raise ValueError('El administrativo ya existe')


class Mutualistas(MyModel):
    id = PrimaryKeyField()
    nombre = CharField(max_length=45)

    class Meta:
        table_name = 'mutualistas'


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

    @classmethod
    def create_paciente(cls, p_nombres, p_apellidos, p_email, p_ci, p_telefono1,
        p_telefono2, p_telefono3, p_direccion, p_localidad, p_departamento, p_pais,
        p_fecha_de_nacimiento, p_sexo, p_observaciones, p_estado, mutualista,
        doctor, enfermero, altura, tipo_de_paciente, tipo_de_acceso_vascular,
        grupo_sanguineo, rh, primer_dialisis, diabetico, alergico, numero_fnr,
        habilitar_lavado_capilar):

        try:
            persona = Personas.create_persona(p_nombres, p_apellidos, p_email,
                p_ci, p_telefono1, p_telefono2, p_apellidos, p_direccion, p_localidad,
                p_departamento, p_pais, p_fecha_de_nacimiento, p_sexo, p_observaciones,
                p_estado)

            paciente = cls.create(
                personas_id = persona,
                mutualistas_id = mutualista,
                doctores_id = doctor,
                enfermero_id = enfermero,
                altura = altura,
                tipo_de_paciente = tipo_de_paciente,
                tipo_de_acceso_vascular = tipo_de_acceso_vascular,
                grupo_sanguineo = grupo_sanguineo,
                rh = rh,
                primer_dialisis = primer_dialisis,
                diabetico = diabetico,
                alergico = alergico,
                numero_fnr = numero_fnr,
                habilitar_lavado_capilar = habilitar_lavado_capilar
            )

            return paciente

        except IntegrityError:
            raise ValueError('User already exists')
    
    @classmethod
    def check_paciente_ci(cls, ci):
        try:
            persona = Personas.get(Personas.ci == ci)
        except:
            return False
        else:
            return True


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
    if( Usuarios.check_usuario_ci(1234567) ):
        print('Horacio Sosa ya existe')
    else:
        usuario = Usuarios.create_usuario(
            'Horacio',
            'Sosa',
            'horaciososa@comero.com.uy',
            1234567,
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
            'nurse',
            'horaciososa',
            '123456',
            True,
            ''
        )

        print('Horacio Sosa fue agregado con éxito')
    
    ##Crear doctora en jefe
    if( Usuarios.check_usuario_ci(2345678) ):
        print('Delia Pereyra ya existe')
    else:
        doctor = Usuarios.create_usuario(
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
            'doctor',
            'deliapereyra',
            '654321',
            True,
            1234
        )

        print('Delia Pereyra fue agregada con éxito')

    ##Crear enfermera
    if( Usuarios.check_usuario_ci(3456789) ):
        print('Bettina Rey ya existe')
    else:
        enfermero = Usuarios.create_usuario(
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
            'enfermero',
            'bettinarey',
            '123456'
        )

        print('Delia Pereyra fue agregada con éxito')

    ##Crear mutualista
    mutualista, created = Mutualistas.get_or_create(Mutualistas.nombre = 'ASSE')

    ##Crear paciente
    if( Pacientes.check_paciente_ci(4694361) ):
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
            mutualista,
            doctor,
            enfermero,
            182,
            'ambulatorio',
            'fistula_nativa',
            'b',
            '+',
            datetime.datetime.strptime('Jul 9 2008', '%b %d %Y'),
            False,
            True,
            211076,
            True
        )

        print('Denry Techera fue agregado con éxito')

    db.close()
