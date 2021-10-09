PGDMP         8            	    y            postgres    13.4    13.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13442    postgres    DATABASE     d   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3353                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �           1247    24753    estado_habitacion    TYPE     w   CREATE TYPE public.estado_habitacion AS ENUM (
    'OCUPADA',
    'RESERVADA',
    'LIBRE',
    'FUERA_DE_SERVICIO'
);
 $   DROP TYPE public.estado_habitacion;
       public          postgres    false            �           1247    24774    tipo_consumo    TYPE     \   CREATE TYPE public.tipo_consumo AS ENUM (
    'BAR',
    'SAUNA',
    'LAVADO_PLANCHADO'
);
    DROP TYPE public.tipo_consumo;
       public          postgres    false            �           1247    24762    tipo_habitacion    TYPE     �   CREATE TYPE public.tipo_habitacion AS ENUM (
    'INDIVIDUAL_ESTANDAR',
    'DOBLE_ESTANDAR',
    'DOBLE_SUPERIOR',
    'SUPERIOR_FAMILY_PLAN',
    'SUITE_DOBLE'
);
 "   DROP TYPE public.tipo_habitacion;
       public          postgres    false            �            1259    24578    banco    TABLE     b   CREATE TABLE public.banco (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.banco;
       public         heap    postgres    false            �            1259    24576    banco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.banco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banco_id_seq;
       public          postgres    false    202                       0    0    banco_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banco_id_seq OWNED BY public.banco.id;
          public          postgres    false    201            �            1259    24981    cheque    TABLE     �   CREATE TABLE public.cheque (
    id_cheque integer NOT NULL,
    nro character varying(50) NOT NULL,
    fecha_cobro date NOT NULL,
    id_medio_pago integer NOT NULL,
    id_banco integer NOT NULL,
    id_localidad integer NOT NULL
);
    DROP TABLE public.cheque;
       public         heap    postgres    false            �            1259    24979    cheque_id_cheque_seq    SEQUENCE     �   CREATE SEQUENCE public.cheque_id_cheque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.cheque_id_cheque_seq;
       public          postgres    false    254                       0    0    cheque_id_cheque_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.cheque_id_cheque_seq OWNED BY public.cheque.id_cheque;
          public          postgres    false    253            �            1259    24839    consumo    TABLE       CREATE TABLE public.consumo (
    id integer NOT NULL,
    nombre_producto character varying(50) NOT NULL,
    precio_unitario double precision NOT NULL,
    cantidad integer NOT NULL,
    tipo public.tipo_consumo NOT NULL,
    id_habitacion integer NOT NULL
);
    DROP TABLE public.consumo;
       public         heap    postgres    false    741            �            1259    24837    consumo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.consumo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.consumo_id_seq;
       public          postgres    false    236                       0    0    consumo_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.consumo_id_seq OWNED BY public.consumo.id;
          public          postgres    false    235            �            1259    24723    costo    TABLE     �   CREATE TABLE public.costo (
    id integer NOT NULL,
    valor double precision NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    id_moneda integer
);
    DROP TABLE public.costo;
       public         heap    postgres    false            �            1259    24721    costo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.costo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.costo_id_seq;
       public          postgres    false    226                       0    0    costo_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.costo_id_seq OWNED BY public.costo.id;
          public          postgres    false    225            �            1259    24938    efectivo    TABLE     g   CREATE TABLE public.efectivo (
    id_efectivo integer NOT NULL,
    id_medio_pago integer NOT NULL
);
    DROP TABLE public.efectivo;
       public         heap    postgres    false            �            1259    24936    efectivo_id_efectivo_seq    SEQUENCE     �   CREATE SEQUENCE public.efectivo_id_efectivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.efectivo_id_efectivo_seq;
       public          postgres    false    248                        0    0    efectivo_id_efectivo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.efectivo_id_efectivo_seq OWNED BY public.efectivo.id_efectivo;
          public          postgres    false    247            �            1259    24702    eventual_pasajero    TABLE     �   CREATE TABLE public.eventual_pasajero (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    telefono character varying(30) NOT NULL
);
 %   DROP TABLE public.eventual_pasajero;
       public         heap    postgres    false            �            1259    24700    eventual_pasajero_id_seq    SEQUENCE     �   CREATE SEQUENCE public.eventual_pasajero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.eventual_pasajero_id_seq;
       public          postgres    false    222            !           0    0    eventual_pasajero_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.eventual_pasajero_id_seq OWNED BY public.eventual_pasajero.id;
          public          postgres    false    221            �            1259    24883    factura    TABLE     �  CREATE TABLE public.factura (
    id integer NOT NULL,
    numero integer NOT NULL,
    tipo character(1) NOT NULL,
    iva double precision NOT NULL,
    importe_neto double precision NOT NULL,
    importe_total double precision NOT NULL,
    id_responsable_pago integer NOT NULL,
    id_nota_credito integer,
    id_ocupacion integer NOT NULL,
    CONSTRAINT factura_tipo_check CHECK ((tipo = ANY (ARRAY['A'::bpchar, 'B'::bpchar])))
);
    DROP TABLE public.factura;
       public         heap    postgres    false            �            1259    24881    factura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.factura_id_seq;
       public          postgres    false    242            "           0    0    factura_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.factura_id_seq OWNED BY public.factura.id;
          public          postgres    false    241            �            1259    24783 
   habitacion    TABLE     �   CREATE TABLE public.habitacion (
    id integer NOT NULL,
    numero integer NOT NULL,
    estado public.estado_habitacion NOT NULL,
    tipo public.tipo_habitacion NOT NULL
);
    DROP TABLE public.habitacion;
       public         heap    postgres    false    735    738            �            1259    24781    habitacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.habitacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.habitacion_id_seq;
       public          postgres    false    230            #           0    0    habitacion_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.habitacion_id_seq OWNED BY public.habitacion.id;
          public          postgres    false    229            �            1259    24651 	   localidad    TABLE     �   CREATE TABLE public.localidad (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL,
    codigo_postal character varying(10) NOT NULL,
    id_provincia integer NOT NULL
);
    DROP TABLE public.localidad;
       public         heap    postgres    false            �            1259    24649    localidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.localidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.localidad_id_seq;
       public          postgres    false    216            $           0    0    localidad_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.localidad_id_seq OWNED BY public.localidad.id;
          public          postgres    false    215            �            1259    24920 
   medio_pago    TABLE     �   CREATE TABLE public.medio_pago (
    id integer NOT NULL,
    importe double precision NOT NULL,
    cotizacion double precision NOT NULL,
    id_moneda integer NOT NULL,
    id_pago integer NOT NULL
);
    DROP TABLE public.medio_pago;
       public         heap    postgres    false            �            1259    24918    medio_pago_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medio_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.medio_pago_id_seq;
       public          postgres    false    246            %           0    0    medio_pago_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.medio_pago_id_seq OWNED BY public.medio_pago.id;
          public          postgres    false    245            �            1259    24692    moneda    TABLE     c   CREATE TABLE public.moneda (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.moneda;
       public         heap    postgres    false            �            1259    24690    moneda_id_seq    SEQUENCE     �   CREATE SEQUENCE public.moneda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.moneda_id_seq;
       public          postgres    false    220            &           0    0    moneda_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.moneda_id_seq OWNED BY public.moneda.id;
          public          postgres    false    219            �            1259    24870    nota_credito    TABLE       CREATE TABLE public.nota_credito (
    id integer NOT NULL,
    numero integer NOT NULL,
    iva double precision NOT NULL,
    importe_neto double precision NOT NULL,
    importe_total double precision NOT NULL,
    id_responsable_pago integer NOT NULL
);
     DROP TABLE public.nota_credito;
       public         heap    postgres    false            �            1259    24868    nota_credito_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nota_credito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.nota_credito_id_seq;
       public          postgres    false    240            '           0    0    nota_credito_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.nota_credito_id_seq OWNED BY public.nota_credito.id;
          public          postgres    false    239            �            1259    24791 	   ocupacion    TABLE     �   CREATE TABLE public.ocupacion (
    id integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    id_responsable integer NOT NULL,
    id_habitacion integer NOT NULL
);
    DROP TABLE public.ocupacion;
       public         heap    postgres    false            �            1259    24789    ocupacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ocupacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ocupacion_id_seq;
       public          postgres    false    232            (           0    0    ocupacion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.ocupacion_id_seq OWNED BY public.ocupacion.id;
          public          postgres    false    231            �            1259    24907    pago    TABLE     �   CREATE TABLE public.pago (
    id integer NOT NULL,
    importe double precision NOT NULL,
    vuelto double precision NOT NULL,
    id_factura integer NOT NULL
);
    DROP TABLE public.pago;
       public         heap    postgres    false            �            1259    24905    pago_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.pago_id_seq;
       public          postgres    false    244            )           0    0    pago_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.pago_id_seq OWNED BY public.pago.id;
          public          postgres    false    243            �            1259    24628    pais    TABLE     a   CREATE TABLE public.pais (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL
);
    DROP TABLE public.pais;
       public         heap    postgres    false            �            1259    24626    pais_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.pais_id_seq;
       public          postgres    false    212            *           0    0    pais_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.pais_id_seq OWNED BY public.pais.id;
          public          postgres    false    211            �            1259    24664    pasajero    TABLE     �  CREATE TABLE public.pasajero (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    nro_documento character varying(10) NOT NULL,
    telefono character varying(30) NOT NULL,
    cuit character varying(13),
    fecha_nacimiento date NOT NULL,
    email character varying(70),
    nacionalidad character varying(30) NOT NULL,
    calle character varying(50) NOT NULL,
    nro_calle character varying(10) NOT NULL,
    departamento character varying(10),
    piso integer,
    id_profesion integer NOT NULL,
    id_localidad integer NOT NULL,
    id_tipo_documento integer NOT NULL,
    id_posicion_frente_iva integer NOT NULL
);
    DROP TABLE public.pasajero;
       public         heap    postgres    false            �            1259    24662    pasajero_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pasajero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pasajero_id_seq;
       public          postgres    false    218            +           0    0    pasajero_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pasajero_id_seq OWNED BY public.pasajero.id;
          public          postgres    false    217            �            1259    24710    persona_juridica    TABLE     ~  CREATE TABLE public.persona_juridica (
    id integer NOT NULL,
    calle character varying(50) NOT NULL,
    nro_calle character varying(10) NOT NULL,
    telefono character varying(30) NOT NULL,
    cuit character varying(13) NOT NULL,
    razon_social character varying(50) NOT NULL,
    departamento character varying(10),
    piso integer,
    id_localidad integer NOT NULL
);
 $   DROP TABLE public.persona_juridica;
       public         heap    postgres    false            �            1259    24708    persona_juridica_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_juridica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.persona_juridica_id_seq;
       public          postgres    false    224            ,           0    0    persona_juridica_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.persona_juridica_id_seq OWNED BY public.persona_juridica.id;
          public          postgres    false    223            �            1259    24822    posee    TABLE     a   CREATE TABLE public.posee (
    id_habitacion integer NOT NULL,
    id_costo integer NOT NULL
);
    DROP TABLE public.posee;
       public         heap    postgres    false            �            1259    24618    posicion_frente_iva    TABLE     p   CREATE TABLE public.posicion_frente_iva (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 '   DROP TABLE public.posicion_frente_iva;
       public         heap    postgres    false            �            1259    24616    posicion_frente_iva_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posicion_frente_iva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.posicion_frente_iva_id_seq;
       public          postgres    false    210            -           0    0    posicion_frente_iva_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.posicion_frente_iva_id_seq OWNED BY public.posicion_frente_iva.id;
          public          postgres    false    209            �            1259    24608 	   profesion    TABLE     f   CREATE TABLE public.profesion (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL
);
    DROP TABLE public.profesion;
       public         heap    postgres    false            �            1259    24606    profesion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.profesion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.profesion_id_seq;
       public          postgres    false    208            .           0    0    profesion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.profesion_id_seq OWNED BY public.profesion.id;
          public          postgres    false    207            �            1259    24638 	   provincia    TABLE     �   CREATE TABLE public.provincia (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL,
    id_pais integer NOT NULL
);
    DROP TABLE public.provincia;
       public         heap    postgres    false            �            1259    24636    provincia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provincia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provincia_id_seq;
       public          postgres    false    214            /           0    0    provincia_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provincia_id_seq OWNED BY public.provincia.id;
          public          postgres    false    213            �            1259    24852    reserva    TABLE     �   CREATE TABLE public.reserva (
    id integer NOT NULL,
    fecha_ingreso date NOT NULL,
    fecha_egreso date NOT NULL,
    id_habitacion integer NOT NULL,
    id_eventual_pasajero integer NOT NULL
);
    DROP TABLE public.reserva;
       public         heap    postgres    false            �            1259    24850    reserva_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reserva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reserva_id_seq;
       public          postgres    false    238            0           0    0    reserva_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reserva_id_seq OWNED BY public.reserva.id;
          public          postgres    false    237            �            1259    24736    responsable_pago    TABLE     |   CREATE TABLE public.responsable_pago (
    id integer NOT NULL,
    id_pasajero integer,
    id_persona_juridica integer
);
 $   DROP TABLE public.responsable_pago;
       public         heap    postgres    false            �            1259    24734    responsable_pago_id_seq    SEQUENCE     �   CREATE SEQUENCE public.responsable_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.responsable_pago_id_seq;
       public          postgres    false    228            1           0    0    responsable_pago_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.responsable_pago_id_seq OWNED BY public.responsable_pago.id;
          public          postgres    false    227                        1259    25004    se_detalla_en    TABLE     �   CREATE TABLE public.se_detalla_en (
    id integer NOT NULL,
    cantidad integer NOT NULL,
    id_consumo integer,
    id_factura integer NOT NULL
);
 !   DROP TABLE public.se_detalla_en;
       public         heap    postgres    false            �            1259    25002    se_detalla_en_id_seq    SEQUENCE     �   CREATE SEQUENCE public.se_detalla_en_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.se_detalla_en_id_seq;
       public          postgres    false    256            2           0    0    se_detalla_en_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.se_detalla_en_id_seq OWNED BY public.se_detalla_en.id;
          public          postgres    false    255            �            1259    24966    tarjeta_credito    TABLE     �   CREATE TABLE public.tarjeta_credito (
    id_tarjeta_credito integer NOT NULL,
    nombre character varying(50) NOT NULL,
    id_medio_pago integer NOT NULL
);
 #   DROP TABLE public.tarjeta_credito;
       public         heap    postgres    false            �            1259    24964 &   tarjeta_credito_id_tarjeta_credito_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_credito_id_tarjeta_credito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.tarjeta_credito_id_tarjeta_credito_seq;
       public          postgres    false    252            3           0    0 &   tarjeta_credito_id_tarjeta_credito_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.tarjeta_credito_id_tarjeta_credito_seq OWNED BY public.tarjeta_credito.id_tarjeta_credito;
          public          postgres    false    251            �            1259    24951    tarjeta_debito    TABLE     �   CREATE TABLE public.tarjeta_debito (
    id_tarjeta_debito integer NOT NULL,
    nombre character varying(50) NOT NULL,
    id_medio_pago integer NOT NULL
);
 "   DROP TABLE public.tarjeta_debito;
       public         heap    postgres    false            �            1259    24949 $   tarjeta_debito_id_tarjeta_debito_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_debito_id_tarjeta_debito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.tarjeta_debito_id_tarjeta_debito_seq;
       public          postgres    false    250            4           0    0 $   tarjeta_debito_id_tarjeta_debito_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.tarjeta_debito_id_tarjeta_debito_seq OWNED BY public.tarjeta_debito.id_tarjeta_debito;
          public          postgres    false    249            �            1259    24807    tiene_acompaniantes    TABLE     q   CREATE TABLE public.tiene_acompaniantes (
    id_pasajero integer NOT NULL,
    id_ocupacion integer NOT NULL
);
 '   DROP TABLE public.tiene_acompaniantes;
       public         heap    postgres    false            �            1259    24598    tipo_documento    TABLE     k   CREATE TABLE public.tipo_documento (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL
);
 "   DROP TABLE public.tipo_documento;
       public         heap    postgres    false            �            1259    24596    tipo_documento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_documento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tipo_documento_id_seq;
       public          postgres    false    206            5           0    0    tipo_documento_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tipo_documento_id_seq OWNED BY public.tipo_documento.id;
          public          postgres    false    205            �            1259    24588    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    contrasenia character varying(20) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    24586    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    204            6           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    203            �           2604    24581    banco id    DEFAULT     d   ALTER TABLE ONLY public.banco ALTER COLUMN id SET DEFAULT nextval('public.banco_id_seq'::regclass);
 7   ALTER TABLE public.banco ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    202    202            �           2604    24984    cheque id_cheque    DEFAULT     t   ALTER TABLE ONLY public.cheque ALTER COLUMN id_cheque SET DEFAULT nextval('public.cheque_id_cheque_seq'::regclass);
 ?   ALTER TABLE public.cheque ALTER COLUMN id_cheque DROP DEFAULT;
       public          postgres    false    253    254    254            �           2604    24842 
   consumo id    DEFAULT     h   ALTER TABLE ONLY public.consumo ALTER COLUMN id SET DEFAULT nextval('public.consumo_id_seq'::regclass);
 9   ALTER TABLE public.consumo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    24726    costo id    DEFAULT     d   ALTER TABLE ONLY public.costo ALTER COLUMN id SET DEFAULT nextval('public.costo_id_seq'::regclass);
 7   ALTER TABLE public.costo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    24941    efectivo id_efectivo    DEFAULT     |   ALTER TABLE ONLY public.efectivo ALTER COLUMN id_efectivo SET DEFAULT nextval('public.efectivo_id_efectivo_seq'::regclass);
 C   ALTER TABLE public.efectivo ALTER COLUMN id_efectivo DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    24705    eventual_pasajero id    DEFAULT     |   ALTER TABLE ONLY public.eventual_pasajero ALTER COLUMN id SET DEFAULT nextval('public.eventual_pasajero_id_seq'::regclass);
 C   ALTER TABLE public.eventual_pasajero ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    24886 
   factura id    DEFAULT     h   ALTER TABLE ONLY public.factura ALTER COLUMN id SET DEFAULT nextval('public.factura_id_seq'::regclass);
 9   ALTER TABLE public.factura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    24786    habitacion id    DEFAULT     n   ALTER TABLE ONLY public.habitacion ALTER COLUMN id SET DEFAULT nextval('public.habitacion_id_seq'::regclass);
 <   ALTER TABLE public.habitacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    24654    localidad id    DEFAULT     l   ALTER TABLE ONLY public.localidad ALTER COLUMN id SET DEFAULT nextval('public.localidad_id_seq'::regclass);
 ;   ALTER TABLE public.localidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    24923    medio_pago id    DEFAULT     n   ALTER TABLE ONLY public.medio_pago ALTER COLUMN id SET DEFAULT nextval('public.medio_pago_id_seq'::regclass);
 <   ALTER TABLE public.medio_pago ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    24695 	   moneda id    DEFAULT     f   ALTER TABLE ONLY public.moneda ALTER COLUMN id SET DEFAULT nextval('public.moneda_id_seq'::regclass);
 8   ALTER TABLE public.moneda ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    24873    nota_credito id    DEFAULT     r   ALTER TABLE ONLY public.nota_credito ALTER COLUMN id SET DEFAULT nextval('public.nota_credito_id_seq'::regclass);
 >   ALTER TABLE public.nota_credito ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    24794    ocupacion id    DEFAULT     l   ALTER TABLE ONLY public.ocupacion ALTER COLUMN id SET DEFAULT nextval('public.ocupacion_id_seq'::regclass);
 ;   ALTER TABLE public.ocupacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    24910    pago id    DEFAULT     b   ALTER TABLE ONLY public.pago ALTER COLUMN id SET DEFAULT nextval('public.pago_id_seq'::regclass);
 6   ALTER TABLE public.pago ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            �           2604    24631    pais id    DEFAULT     b   ALTER TABLE ONLY public.pais ALTER COLUMN id SET DEFAULT nextval('public.pais_id_seq'::regclass);
 6   ALTER TABLE public.pais ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    24667    pasajero id    DEFAULT     j   ALTER TABLE ONLY public.pasajero ALTER COLUMN id SET DEFAULT nextval('public.pasajero_id_seq'::regclass);
 :   ALTER TABLE public.pasajero ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    24713    persona_juridica id    DEFAULT     z   ALTER TABLE ONLY public.persona_juridica ALTER COLUMN id SET DEFAULT nextval('public.persona_juridica_id_seq'::regclass);
 B   ALTER TABLE public.persona_juridica ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    24621    posicion_frente_iva id    DEFAULT     �   ALTER TABLE ONLY public.posicion_frente_iva ALTER COLUMN id SET DEFAULT nextval('public.posicion_frente_iva_id_seq'::regclass);
 E   ALTER TABLE public.posicion_frente_iva ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    24611    profesion id    DEFAULT     l   ALTER TABLE ONLY public.profesion ALTER COLUMN id SET DEFAULT nextval('public.profesion_id_seq'::regclass);
 ;   ALTER TABLE public.profesion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208            �           2604    24641    provincia id    DEFAULT     l   ALTER TABLE ONLY public.provincia ALTER COLUMN id SET DEFAULT nextval('public.provincia_id_seq'::regclass);
 ;   ALTER TABLE public.provincia ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    24855 
   reserva id    DEFAULT     h   ALTER TABLE ONLY public.reserva ALTER COLUMN id SET DEFAULT nextval('public.reserva_id_seq'::regclass);
 9   ALTER TABLE public.reserva ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    24739    responsable_pago id    DEFAULT     z   ALTER TABLE ONLY public.responsable_pago ALTER COLUMN id SET DEFAULT nextval('public.responsable_pago_id_seq'::regclass);
 B   ALTER TABLE public.responsable_pago ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    25007    se_detalla_en id    DEFAULT     t   ALTER TABLE ONLY public.se_detalla_en ALTER COLUMN id SET DEFAULT nextval('public.se_detalla_en_id_seq'::regclass);
 ?   ALTER TABLE public.se_detalla_en ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    24969 "   tarjeta_credito id_tarjeta_credito    DEFAULT     �   ALTER TABLE ONLY public.tarjeta_credito ALTER COLUMN id_tarjeta_credito SET DEFAULT nextval('public.tarjeta_credito_id_tarjeta_credito_seq'::regclass);
 Q   ALTER TABLE public.tarjeta_credito ALTER COLUMN id_tarjeta_credito DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    24954     tarjeta_debito id_tarjeta_debito    DEFAULT     �   ALTER TABLE ONLY public.tarjeta_debito ALTER COLUMN id_tarjeta_debito SET DEFAULT nextval('public.tarjeta_debito_id_tarjeta_debito_seq'::regclass);
 O   ALTER TABLE public.tarjeta_debito ALTER COLUMN id_tarjeta_debito DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    24601    tipo_documento id    DEFAULT     v   ALTER TABLE ONLY public.tipo_documento ALTER COLUMN id SET DEFAULT nextval('public.tipo_documento_id_seq'::regclass);
 @   ALTER TABLE public.tipo_documento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    206    206            �           2604    24591 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            �          0    24578    banco 
   TABLE DATA           +   COPY public.banco (id, nombre) FROM stdin;
    public          postgres    false    202   ((                0    24981    cheque 
   TABLE DATA           d   COPY public.cheque (id_cheque, nro, fecha_cobro, id_medio_pago, id_banco, id_localidad) FROM stdin;
    public          postgres    false    254   E(      �          0    24839    consumo 
   TABLE DATA           f   COPY public.consumo (id, nombre_producto, precio_unitario, cantidad, tipo, id_habitacion) FROM stdin;
    public          postgres    false    236   b(      �          0    24723    costo 
   TABLE DATA           N   COPY public.costo (id, valor, fecha_inicio, fecha_fin, id_moneda) FROM stdin;
    public          postgres    false    226   (                0    24938    efectivo 
   TABLE DATA           >   COPY public.efectivo (id_efectivo, id_medio_pago) FROM stdin;
    public          postgres    false    248   �(      �          0    24702    eventual_pasajero 
   TABLE DATA           K   COPY public.eventual_pasajero (id, nombre, apellido, telefono) FROM stdin;
    public          postgres    false    222   �(                0    24883    factura 
   TABLE DATA           �   COPY public.factura (id, numero, tipo, iva, importe_neto, importe_total, id_responsable_pago, id_nota_credito, id_ocupacion) FROM stdin;
    public          postgres    false    242   �(      �          0    24783 
   habitacion 
   TABLE DATA           >   COPY public.habitacion (id, numero, estado, tipo) FROM stdin;
    public          postgres    false    230   �(      �          0    24651 	   localidad 
   TABLE DATA           L   COPY public.localidad (id, nombre, codigo_postal, id_provincia) FROM stdin;
    public          postgres    false    216   )      	          0    24920 
   medio_pago 
   TABLE DATA           Q   COPY public.medio_pago (id, importe, cotizacion, id_moneda, id_pago) FROM stdin;
    public          postgres    false    246   ,      �          0    24692    moneda 
   TABLE DATA           ,   COPY public.moneda (id, nombre) FROM stdin;
    public          postgres    false    220   /,                0    24870    nota_credito 
   TABLE DATA           i   COPY public.nota_credito (id, numero, iva, importe_neto, importe_total, id_responsable_pago) FROM stdin;
    public          postgres    false    240   L,      �          0    24791 	   ocupacion 
   TABLE DATA           _   COPY public.ocupacion (id, fecha_inicio, fecha_fin, id_responsable, id_habitacion) FROM stdin;
    public          postgres    false    232   i,                0    24907    pago 
   TABLE DATA           ?   COPY public.pago (id, importe, vuelto, id_factura) FROM stdin;
    public          postgres    false    244   �,      �          0    24628    pais 
   TABLE DATA           *   COPY public.pais (id, nombre) FROM stdin;
    public          postgres    false    212   �,      �          0    24664    pasajero 
   TABLE DATA           �   COPY public.pasajero (id, nombre, apellido, nro_documento, telefono, cuit, fecha_nacimiento, email, nacionalidad, calle, nro_calle, departamento, piso, id_profesion, id_localidad, id_tipo_documento, id_posicion_frente_iva) FROM stdin;
    public          postgres    false    218   -      �          0    24710    persona_juridica 
   TABLE DATA           �   COPY public.persona_juridica (id, calle, nro_calle, telefono, cuit, razon_social, departamento, piso, id_localidad) FROM stdin;
    public          postgres    false    224    -      �          0    24822    posee 
   TABLE DATA           8   COPY public.posee (id_habitacion, id_costo) FROM stdin;
    public          postgres    false    234   =-      �          0    24618    posicion_frente_iva 
   TABLE DATA           9   COPY public.posicion_frente_iva (id, nombre) FROM stdin;
    public          postgres    false    210   Z-      �          0    24608 	   profesion 
   TABLE DATA           /   COPY public.profesion (id, nombre) FROM stdin;
    public          postgres    false    208   �-      �          0    24638 	   provincia 
   TABLE DATA           8   COPY public.provincia (id, nombre, id_pais) FROM stdin;
    public          postgres    false    214   o.                0    24852    reserva 
   TABLE DATA           g   COPY public.reserva (id, fecha_ingreso, fecha_egreso, id_habitacion, id_eventual_pasajero) FROM stdin;
    public          postgres    false    238   |/      �          0    24736    responsable_pago 
   TABLE DATA           P   COPY public.responsable_pago (id, id_pasajero, id_persona_juridica) FROM stdin;
    public          postgres    false    228   �/                0    25004    se_detalla_en 
   TABLE DATA           M   COPY public.se_detalla_en (id, cantidad, id_consumo, id_factura) FROM stdin;
    public          postgres    false    256   �/                0    24966    tarjeta_credito 
   TABLE DATA           T   COPY public.tarjeta_credito (id_tarjeta_credito, nombre, id_medio_pago) FROM stdin;
    public          postgres    false    252   �/                0    24951    tarjeta_debito 
   TABLE DATA           R   COPY public.tarjeta_debito (id_tarjeta_debito, nombre, id_medio_pago) FROM stdin;
    public          postgres    false    250   �/      �          0    24807    tiene_acompaniantes 
   TABLE DATA           H   COPY public.tiene_acompaniantes (id_pasajero, id_ocupacion) FROM stdin;
    public          postgres    false    233   0      �          0    24598    tipo_documento 
   TABLE DATA           4   COPY public.tipo_documento (id, nombre) FROM stdin;
    public          postgres    false    206   *0      �          0    24588    usuario 
   TABLE DATA           :   COPY public.usuario (id, nombre, contrasenia) FROM stdin;
    public          postgres    false    204   G0      7           0    0    banco_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.banco_id_seq', 1, false);
          public          postgres    false    201            8           0    0    cheque_id_cheque_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cheque_id_cheque_seq', 1, false);
          public          postgres    false    253            9           0    0    consumo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.consumo_id_seq', 1, false);
          public          postgres    false    235            :           0    0    costo_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.costo_id_seq', 1, false);
          public          postgres    false    225            ;           0    0    efectivo_id_efectivo_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.efectivo_id_efectivo_seq', 1, false);
          public          postgres    false    247            <           0    0    eventual_pasajero_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.eventual_pasajero_id_seq', 1, false);
          public          postgres    false    221            =           0    0    factura_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.factura_id_seq', 1, false);
          public          postgres    false    241            >           0    0    habitacion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.habitacion_id_seq', 1, false);
          public          postgres    false    229            ?           0    0    localidad_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.localidad_id_seq', 1, false);
          public          postgres    false    215            @           0    0    medio_pago_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.medio_pago_id_seq', 1, false);
          public          postgres    false    245            A           0    0    moneda_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.moneda_id_seq', 1, false);
          public          postgres    false    219            B           0    0    nota_credito_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.nota_credito_id_seq', 1, false);
          public          postgres    false    239            C           0    0    ocupacion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.ocupacion_id_seq', 1, false);
          public          postgres    false    231            D           0    0    pago_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pago_id_seq', 1, false);
          public          postgres    false    243            E           0    0    pais_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pais_id_seq', 1, false);
          public          postgres    false    211            F           0    0    pasajero_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pasajero_id_seq', 1, false);
          public          postgres    false    217            G           0    0    persona_juridica_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.persona_juridica_id_seq', 1, false);
          public          postgres    false    223            H           0    0    posicion_frente_iva_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.posicion_frente_iva_id_seq', 1, false);
          public          postgres    false    209            I           0    0    profesion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.profesion_id_seq', 1, false);
          public          postgres    false    207            J           0    0    provincia_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provincia_id_seq', 1, false);
          public          postgres    false    213            K           0    0    reserva_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reserva_id_seq', 1, false);
          public          postgres    false    237            L           0    0    responsable_pago_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.responsable_pago_id_seq', 1, false);
          public          postgres    false    227            M           0    0    se_detalla_en_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.se_detalla_en_id_seq', 1, false);
          public          postgres    false    255            N           0    0 &   tarjeta_credito_id_tarjeta_credito_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.tarjeta_credito_id_tarjeta_credito_seq', 1, false);
          public          postgres    false    251            O           0    0 $   tarjeta_debito_id_tarjeta_debito_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.tarjeta_debito_id_tarjeta_debito_seq', 1, false);
          public          postgres    false    249            P           0    0    tipo_documento_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tipo_documento_id_seq', 1, false);
          public          postgres    false    205            Q           0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);
          public          postgres    false    203            �           2606    24585    banco banco_nombre_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_nombre_key UNIQUE (nombre);
 @   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_nombre_key;
       public            postgres    false    202            �           2606    24583    banco banco_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_pkey;
       public            postgres    false    202            5           2606    24986    cheque cheque_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT cheque_pkey PRIMARY KEY (id_cheque);
 <   ALTER TABLE ONLY public.cheque DROP CONSTRAINT cheque_pkey;
       public            postgres    false    254                       2606    24844    consumo consumo_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.consumo
    ADD CONSTRAINT consumo_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.consumo DROP CONSTRAINT consumo_pkey;
       public            postgres    false    236                       2606    24728    costo costo_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.costo
    ADD CONSTRAINT costo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.costo DROP CONSTRAINT costo_pkey;
       public            postgres    false    226            +           2606    24943    efectivo efectivo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.efectivo
    ADD CONSTRAINT efectivo_pkey PRIMARY KEY (id_efectivo);
 @   ALTER TABLE ONLY public.efectivo DROP CONSTRAINT efectivo_pkey;
       public            postgres    false    248                       2606    24707 (   eventual_pasajero eventual_pasajero_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.eventual_pasajero
    ADD CONSTRAINT eventual_pasajero_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.eventual_pasajero DROP CONSTRAINT eventual_pasajero_pkey;
       public            postgres    false    222            %           2606    24889    factura factura_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    242                       2606    24788    habitacion habitacion_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.habitacion DROP CONSTRAINT habitacion_pkey;
       public            postgres    false    230                       2606    24656    localidad localidad_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.localidad
    ADD CONSTRAINT localidad_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.localidad DROP CONSTRAINT localidad_pkey;
       public            postgres    false    216            )           2606    24925    medio_pago medio_pago_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.medio_pago
    ADD CONSTRAINT medio_pago_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.medio_pago DROP CONSTRAINT medio_pago_pkey;
       public            postgres    false    246                       2606    24699    moneda moneda_nombre_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.moneda
    ADD CONSTRAINT moneda_nombre_key UNIQUE (nombre);
 B   ALTER TABLE ONLY public.moneda DROP CONSTRAINT moneda_nombre_key;
       public            postgres    false    220                       2606    24697    moneda moneda_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.moneda DROP CONSTRAINT moneda_pkey;
       public            postgres    false    220            #           2606    24875    nota_credito nota_credito_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.nota_credito
    ADD CONSTRAINT nota_credito_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.nota_credito DROP CONSTRAINT nota_credito_pkey;
       public            postgres    false    240                       2606    24796    ocupacion ocupacion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ocupacion
    ADD CONSTRAINT ocupacion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ocupacion DROP CONSTRAINT ocupacion_pkey;
       public            postgres    false    232            '           2606    24912    pago pago_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public            postgres    false    244                       2606    24635    pais pais_nombre_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_nombre_key UNIQUE (nombre);
 >   ALTER TABLE ONLY public.pais DROP CONSTRAINT pais_nombre_key;
       public            postgres    false    212                       2606    24633    pais pais_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.pais DROP CONSTRAINT pais_pkey;
       public            postgres    false    212            	           2606    24669    pasajero pasajero_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.pasajero DROP CONSTRAINT pasajero_pkey;
       public            postgres    false    218                       2606    24715 &   persona_juridica persona_juridica_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.persona_juridica
    ADD CONSTRAINT persona_juridica_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.persona_juridica DROP CONSTRAINT persona_juridica_pkey;
       public            postgres    false    224                       2606    24826    posee posee_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.posee
    ADD CONSTRAINT posee_pkey PRIMARY KEY (id_habitacion, id_costo);
 :   ALTER TABLE ONLY public.posee DROP CONSTRAINT posee_pkey;
       public            postgres    false    234    234            �           2606    24625 2   posicion_frente_iva posicion_frente_iva_nombre_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.posicion_frente_iva
    ADD CONSTRAINT posicion_frente_iva_nombre_key UNIQUE (nombre);
 \   ALTER TABLE ONLY public.posicion_frente_iva DROP CONSTRAINT posicion_frente_iva_nombre_key;
       public            postgres    false    210            �           2606    24623 ,   posicion_frente_iva posicion_frente_iva_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.posicion_frente_iva
    ADD CONSTRAINT posicion_frente_iva_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.posicion_frente_iva DROP CONSTRAINT posicion_frente_iva_pkey;
       public            postgres    false    210            �           2606    24615    profesion profesion_nombre_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.profesion
    ADD CONSTRAINT profesion_nombre_key UNIQUE (nombre);
 H   ALTER TABLE ONLY public.profesion DROP CONSTRAINT profesion_nombre_key;
       public            postgres    false    208            �           2606    24613    profesion profesion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.profesion
    ADD CONSTRAINT profesion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.profesion DROP CONSTRAINT profesion_pkey;
       public            postgres    false    208                       2606    24643    provincia provincia_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_pkey;
       public            postgres    false    214            !           2606    24857    reserva reserva_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public            postgres    false    238                       2606    24741 &   responsable_pago responsable_pago_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.responsable_pago
    ADD CONSTRAINT responsable_pago_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.responsable_pago DROP CONSTRAINT responsable_pago_pkey;
       public            postgres    false    228            7           2606    25009     se_detalla_en se_detalla_en_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.se_detalla_en
    ADD CONSTRAINT se_detalla_en_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.se_detalla_en DROP CONSTRAINT se_detalla_en_pkey;
       public            postgres    false    256            1           2606    24973 *   tarjeta_credito tarjeta_credito_nombre_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.tarjeta_credito
    ADD CONSTRAINT tarjeta_credito_nombre_key UNIQUE (nombre);
 T   ALTER TABLE ONLY public.tarjeta_credito DROP CONSTRAINT tarjeta_credito_nombre_key;
       public            postgres    false    252            3           2606    24971 $   tarjeta_credito tarjeta_credito_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.tarjeta_credito
    ADD CONSTRAINT tarjeta_credito_pkey PRIMARY KEY (id_tarjeta_credito);
 N   ALTER TABLE ONLY public.tarjeta_credito DROP CONSTRAINT tarjeta_credito_pkey;
       public            postgres    false    252            -           2606    24958 (   tarjeta_debito tarjeta_debito_nombre_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.tarjeta_debito
    ADD CONSTRAINT tarjeta_debito_nombre_key UNIQUE (nombre);
 R   ALTER TABLE ONLY public.tarjeta_debito DROP CONSTRAINT tarjeta_debito_nombre_key;
       public            postgres    false    250            /           2606    24956 "   tarjeta_debito tarjeta_debito_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tarjeta_debito
    ADD CONSTRAINT tarjeta_debito_pkey PRIMARY KEY (id_tarjeta_debito);
 L   ALTER TABLE ONLY public.tarjeta_debito DROP CONSTRAINT tarjeta_debito_pkey;
       public            postgres    false    250                       2606    24811 ,   tiene_acompaniantes tiene_acompaniantes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.tiene_acompaniantes
    ADD CONSTRAINT tiene_acompaniantes_pkey PRIMARY KEY (id_pasajero, id_ocupacion);
 V   ALTER TABLE ONLY public.tiene_acompaniantes DROP CONSTRAINT tiene_acompaniantes_pkey;
       public            postgres    false    233    233            �           2606    24605 (   tipo_documento tipo_documento_nombre_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_nombre_key UNIQUE (nombre);
 R   ALTER TABLE ONLY public.tipo_documento DROP CONSTRAINT tipo_documento_nombre_key;
       public            postgres    false    206            �           2606    24603 "   tipo_documento tipo_documento_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_documento DROP CONSTRAINT tipo_documento_pkey;
       public            postgres    false    206            �           2606    24595    usuario usuario_nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nombre_key UNIQUE (nombre);
 D   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_nombre_key;
       public            postgres    false    204            �           2606    24593    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    204            V           2606    24992    cheque cheque_id_banco_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT cheque_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES public.banco(id);
 E   ALTER TABLE ONLY public.cheque DROP CONSTRAINT cheque_id_banco_fkey;
       public          postgres    false    254    202    3055            W           2606    24997    cheque cheque_id_localidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT cheque_id_localidad_fkey FOREIGN KEY (id_localidad) REFERENCES public.localidad(id);
 I   ALTER TABLE ONLY public.cheque DROP CONSTRAINT cheque_id_localidad_fkey;
       public          postgres    false    3079    254    216            U           2606    24987     cheque cheque_id_medio_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT cheque_id_medio_pago_fkey FOREIGN KEY (id_medio_pago) REFERENCES public.medio_pago(id);
 J   ALTER TABLE ONLY public.cheque DROP CONSTRAINT cheque_id_medio_pago_fkey;
       public          postgres    false    3113    254    246            H           2606    24845 "   consumo consumo_id_habitacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.consumo
    ADD CONSTRAINT consumo_id_habitacion_fkey FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id);
 L   ALTER TABLE ONLY public.consumo DROP CONSTRAINT consumo_id_habitacion_fkey;
       public          postgres    false    236    230    3095            ?           2606    24729    costo costo_id_moneda_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.costo
    ADD CONSTRAINT costo_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES public.moneda(id);
 D   ALTER TABLE ONLY public.costo DROP CONSTRAINT costo_id_moneda_fkey;
       public          postgres    false    220    3085    226            R           2606    24944 $   efectivo efectivo_id_medio_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.efectivo
    ADD CONSTRAINT efectivo_id_medio_pago_fkey FOREIGN KEY (id_medio_pago) REFERENCES public.medio_pago(id);
 N   ALTER TABLE ONLY public.efectivo DROP CONSTRAINT efectivo_id_medio_pago_fkey;
       public          postgres    false    248    246    3113            M           2606    24895 $   factura factura_id_nota_credito_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_nota_credito_fkey FOREIGN KEY (id_nota_credito) REFERENCES public.nota_credito(id);
 N   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_nota_credito_fkey;
       public          postgres    false    242    240    3107            N           2606    24900 !   factura factura_id_ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_ocupacion_fkey FOREIGN KEY (id_ocupacion) REFERENCES public.ocupacion(id);
 K   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_ocupacion_fkey;
       public          postgres    false    232    242    3097            L           2606    24890 (   factura factura_id_responsable_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_responsable_pago_fkey FOREIGN KEY (id_responsable_pago) REFERENCES public.responsable_pago(id);
 R   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_responsable_pago_fkey;
       public          postgres    false    242    228    3093            9           2606    24657 %   localidad localidad_id_provincia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.localidad
    ADD CONSTRAINT localidad_id_provincia_fkey FOREIGN KEY (id_provincia) REFERENCES public.provincia(id);
 O   ALTER TABLE ONLY public.localidad DROP CONSTRAINT localidad_id_provincia_fkey;
       public          postgres    false    3077    216    214            P           2606    24926 $   medio_pago medio_pago_id_moneda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medio_pago
    ADD CONSTRAINT medio_pago_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES public.moneda(id);
 N   ALTER TABLE ONLY public.medio_pago DROP CONSTRAINT medio_pago_id_moneda_fkey;
       public          postgres    false    220    3085    246            Q           2606    24931 "   medio_pago medio_pago_id_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medio_pago
    ADD CONSTRAINT medio_pago_id_pago_fkey FOREIGN KEY (id_pago) REFERENCES public.pago(id);
 L   ALTER TABLE ONLY public.medio_pago DROP CONSTRAINT medio_pago_id_pago_fkey;
       public          postgres    false    3111    244    246            K           2606    24876 2   nota_credito nota_credito_id_responsable_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nota_credito
    ADD CONSTRAINT nota_credito_id_responsable_pago_fkey FOREIGN KEY (id_responsable_pago) REFERENCES public.responsable_pago(id);
 \   ALTER TABLE ONLY public.nota_credito DROP CONSTRAINT nota_credito_id_responsable_pago_fkey;
       public          postgres    false    3093    240    228            C           2606    24802 &   ocupacion ocupacion_id_habitacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocupacion
    ADD CONSTRAINT ocupacion_id_habitacion_fkey FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id);
 P   ALTER TABLE ONLY public.ocupacion DROP CONSTRAINT ocupacion_id_habitacion_fkey;
       public          postgres    false    230    3095    232            B           2606    24797 '   ocupacion ocupacion_id_responsable_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocupacion
    ADD CONSTRAINT ocupacion_id_responsable_fkey FOREIGN KEY (id_responsable) REFERENCES public.pasajero(id);
 Q   ALTER TABLE ONLY public.ocupacion DROP CONSTRAINT ocupacion_id_responsable_fkey;
       public          postgres    false    3081    218    232            O           2606    24913    pago pago_id_factura_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id);
 C   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_id_factura_fkey;
       public          postgres    false    244    3109    242            ;           2606    24675 #   pasajero pasajero_id_localidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_id_localidad_fkey FOREIGN KEY (id_localidad) REFERENCES public.localidad(id);
 M   ALTER TABLE ONLY public.pasajero DROP CONSTRAINT pasajero_id_localidad_fkey;
       public          postgres    false    218    216    3079            =           2606    24685 -   pasajero pasajero_id_posicion_frente_iva_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_id_posicion_frente_iva_fkey FOREIGN KEY (id_posicion_frente_iva) REFERENCES public.posicion_frente_iva(id);
 W   ALTER TABLE ONLY public.pasajero DROP CONSTRAINT pasajero_id_posicion_frente_iva_fkey;
       public          postgres    false    3071    218    210            :           2606    24670 #   pasajero pasajero_id_profesion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_id_profesion_fkey FOREIGN KEY (id_profesion) REFERENCES public.profesion(id);
 M   ALTER TABLE ONLY public.pasajero DROP CONSTRAINT pasajero_id_profesion_fkey;
       public          postgres    false    208    3067    218            <           2606    24680 (   pasajero pasajero_id_tipo_documento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_id_tipo_documento_fkey FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id);
 R   ALTER TABLE ONLY public.pasajero DROP CONSTRAINT pasajero_id_tipo_documento_fkey;
       public          postgres    false    218    206    3063            >           2606    24716 3   persona_juridica persona_juridica_id_localidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona_juridica
    ADD CONSTRAINT persona_juridica_id_localidad_fkey FOREIGN KEY (id_localidad) REFERENCES public.localidad(id);
 ]   ALTER TABLE ONLY public.persona_juridica DROP CONSTRAINT persona_juridica_id_localidad_fkey;
       public          postgres    false    224    3079    216            G           2606    24832    posee posee_id_costo_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.posee
    ADD CONSTRAINT posee_id_costo_fkey FOREIGN KEY (id_costo) REFERENCES public.costo(id);
 C   ALTER TABLE ONLY public.posee DROP CONSTRAINT posee_id_costo_fkey;
       public          postgres    false    234    226    3091            F           2606    24827    posee posee_id_habitacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posee
    ADD CONSTRAINT posee_id_habitacion_fkey FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id);
 H   ALTER TABLE ONLY public.posee DROP CONSTRAINT posee_id_habitacion_fkey;
       public          postgres    false    3095    234    230            8           2606    24644     provincia provincia_id_pais_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES public.pais(id);
 J   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_id_pais_fkey;
       public          postgres    false    212    214    3075            J           2606    24863 )   reserva reserva_id_eventual_pasajero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_eventual_pasajero_fkey FOREIGN KEY (id_eventual_pasajero) REFERENCES public.eventual_pasajero(id);
 S   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_id_eventual_pasajero_fkey;
       public          postgres    false    238    3087    222            I           2606    24858 "   reserva reserva_id_habitacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_habitacion_fkey FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id);
 L   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_id_habitacion_fkey;
       public          postgres    false    238    230    3095            @           2606    24742 2   responsable_pago responsable_pago_id_pasajero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responsable_pago
    ADD CONSTRAINT responsable_pago_id_pasajero_fkey FOREIGN KEY (id_pasajero) REFERENCES public.pasajero(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.responsable_pago DROP CONSTRAINT responsable_pago_id_pasajero_fkey;
       public          postgres    false    218    3081    228            A           2606    24747 :   responsable_pago responsable_pago_id_persona_juridica_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responsable_pago
    ADD CONSTRAINT responsable_pago_id_persona_juridica_fkey FOREIGN KEY (id_persona_juridica) REFERENCES public.persona_juridica(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.responsable_pago DROP CONSTRAINT responsable_pago_id_persona_juridica_fkey;
       public          postgres    false    3089    228    224            X           2606    25010 +   se_detalla_en se_detalla_en_id_consumo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.se_detalla_en
    ADD CONSTRAINT se_detalla_en_id_consumo_fkey FOREIGN KEY (id_consumo) REFERENCES public.consumo(id);
 U   ALTER TABLE ONLY public.se_detalla_en DROP CONSTRAINT se_detalla_en_id_consumo_fkey;
       public          postgres    false    256    236    3103            Y           2606    25015 +   se_detalla_en se_detalla_en_id_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.se_detalla_en
    ADD CONSTRAINT se_detalla_en_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id);
 U   ALTER TABLE ONLY public.se_detalla_en DROP CONSTRAINT se_detalla_en_id_factura_fkey;
       public          postgres    false    256    242    3109            T           2606    24974 2   tarjeta_credito tarjeta_credito_id_medio_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta_credito
    ADD CONSTRAINT tarjeta_credito_id_medio_pago_fkey FOREIGN KEY (id_medio_pago) REFERENCES public.medio_pago(id);
 \   ALTER TABLE ONLY public.tarjeta_credito DROP CONSTRAINT tarjeta_credito_id_medio_pago_fkey;
       public          postgres    false    246    252    3113            S           2606    24959 0   tarjeta_debito tarjeta_debito_id_medio_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta_debito
    ADD CONSTRAINT tarjeta_debito_id_medio_pago_fkey FOREIGN KEY (id_medio_pago) REFERENCES public.medio_pago(id);
 Z   ALTER TABLE ONLY public.tarjeta_debito DROP CONSTRAINT tarjeta_debito_id_medio_pago_fkey;
       public          postgres    false    3113    246    250            E           2606    24817 9   tiene_acompaniantes tiene_acompaniantes_id_ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiene_acompaniantes
    ADD CONSTRAINT tiene_acompaniantes_id_ocupacion_fkey FOREIGN KEY (id_ocupacion) REFERENCES public.ocupacion(id);
 c   ALTER TABLE ONLY public.tiene_acompaniantes DROP CONSTRAINT tiene_acompaniantes_id_ocupacion_fkey;
       public          postgres    false    232    233    3097            D           2606    24812 8   tiene_acompaniantes tiene_acompaniantes_id_pasajero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiene_acompaniantes
    ADD CONSTRAINT tiene_acompaniantes_id_pasajero_fkey FOREIGN KEY (id_pasajero) REFERENCES public.pasajero(id);
 b   ALTER TABLE ONLY public.tiene_acompaniantes DROP CONSTRAINT tiene_acompaniantes_id_pasajero_fkey;
       public          postgres    false    233    3081    218            �      x������ � �            x������ � �      �      x������ � �      �      x������ � �            x������ � �      �      x������ � �            x������ � �      �      x������ � �      �   �  x�MTKn�0]�N�"������(�"H���[���&]J
�ܦ�G�����o�=���)�:�l~˧@Z�?��R�k��6n���rk7��XPҲn�zϤ�R�W��O9���;K�h^��u��Z�:�_9�7�����a���#]��.h�������
`1�B�`���6�����E�7FնH���c��AzQuB�����C��~Ĥ ���%�#�Q�Uu�=L�gT}�P���PC7�^eH=ϣZ�	=w!�h���.�&jA�a��c��H�"�X�t1c����]j3����>� ��1���\��>�'��D��=��:��U}R#��V6kT�*ԗ��^������b�0�+qJ���K�z�����d���S�X����V|8��F�9����9%,���`
�t
2�z���0?J*i�C�1)-������yLEO�s��D�T���JfAh=L�ԡ��Miݴt���ߒ0/�q:N~�諪jl�dH��^P�ZM'!�v!�Ѕ<0�	:�����.��]��*؝�~I͟�x�ȡ�DU�+����0�#��E-�`����@�*@�ªX��/�7!I�x���W��޺���!����L����M��~��Ru+��B�[d��:!���D��5��M��L�U�yf��.q�d�
N���a*h	�:x�d���+9p5�t��Af5s@k�;<R����@�)�T�H
_�UB{h��'v���|ต����K�e� MZ�      	      x������ � �      �      x������ � �            x������ � �      �      x������ � �            x������ � �      �   P   x�3�t,JO�+��K�2�t���,�L�2�t*J,���2�t���I�2�tM.ML�/�2�H-:��˜3��4�4��+F��� "�      �      x������ � �      �      x������ � �      �      x������ � �      �   P   x�3�����/)�L*-�,.I�2�J-.��+NL�IU��+N.�,(��2�t�HN��L8��ҥ��)�E
n�y�9\1z\\\ �&�      �   �   x�%�;�@Dk�0��(!�@)�fc"#�gs �)r1���x���7��V0�����S��Q��J���U���;�L*X@�r�a.m����o�Np��C����Nm?��J�/�!�T�c9���>>L
�S�%��RQ��P�&�.hS�Y��"� �;@e      �   �   x�-�=n�0�g�:A9�ck�C�E�1�[JiqhnӱC���Dt{���#e�Eȇ�<;�lQB�w�355��%o���=�͠z�kHj��\$&��j��&\rb	U`v�V�`�#�9�?!���}r�N`+7�����+�w���.���3OaO�	�`����9H>d����"s���v	o�E}�Jқ���J;q��I���byd��\S�R�aLC��������3�]����$W�ǯ���T�$�f�            x������ � �      �      x������ � �            x������ � �            x������ � �            x������ � �      �      x������ � �      �      x������ � �      �   X   x�%���  ��cL��k\%R�@*,~��.w�G�7�ɕ�E�����
�@ha�cJa��p>��O�?��CM5^Px1�5/     