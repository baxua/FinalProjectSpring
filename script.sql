PGDMP         %                {            Shop    15.1    15.1 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    49475    Shop    DATABASE     z   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop";
                postgres    false            �            1259    49477    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    49476    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    49484    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    49483    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    57668    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    57667    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    223            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    222            �            1259    49491    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    49490    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    219            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    218            �            1259    49500    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    57675    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    57674    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    225            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    224            �            1259    49499    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            ~           2604    49480    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    49487    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    57671 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    49494 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    49503 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    57678    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            (          0    49477    category 
   TABLE DATA                 public          postgres    false    215   q9       *          0    49484    image 
   TABLE DATA                 public          postgres    false    217   �9       0          0    57668    orders 
   TABLE DATA                 public          postgres    false    223   �?       ,          0    49491    person 
   TABLE DATA                 public          postgres    false    219   dA       .          0    49500    product 
   TABLE DATA                 public          postgres    false    221   �C       2          0    57675    product_cart 
   TABLE DATA                 public          postgres    false    225   tM       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.image_id_seq', 125, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 11, true);
          public          postgres    false    222            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 8, true);
          public          postgres    false    218            C           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 21, true);
          public          postgres    false    224            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 28, true);
          public          postgres    false    220            �           2606    49482    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    49489    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    57673    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    223            �           2606    49498    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    219            �           2606    57680    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    225            �           2606    49508    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    49510 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    221            �           2606    57681 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    223    3210    219            �           2606    49516 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    215    3206    221            �           2606    57686 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    3212    223    221            �           2606    49511 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    217    221    3212            �           2606    57696 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    221    225    3212            �           2606    57691 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    219    225    3210            (   t   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0�bÅ}/6^�waӅ]v�kZsy�f�Ƞ�v_�pa�Ŷ��dav˅��@�sq ��K�      *   �  x���K�]G���wg��[�V7Ye�!8;ن~��1!����&s&�s��<�nK�O�y�����>�޽���������?<~������xs[���_���������ϟ���폟���۫���^Z��]3��
iL9�A:ʌ5������O/�ܢ���ŻS��YC[c)�j�ԹQ5��d,�7�&_����s^�-R�I{T�4b�%��u>�u��b���IjҴ�J����#�TE�2M���{���JZ��m�5�*��`�iFh����M���Nu�@��*^�Km���&o��-��h`H���0'��>y�5:�)���e�����C�2���O��<|�vx輦n��Z��B��٨�CPC4CS���kڞ����������A�C��9�ȇ��kn�%f2��D�һЈ�zڨ|{_���N�����OKLS�1��E�	�.�~�"�o]�Pw�
�R�d3��Ē)D�(Z���n&%�H�T)�]&��+`�1'��Z/~o�\Җ��#P��T�s1 ��2rJ=��ߛ�l����P�Z7�5+��VO�7�gl�Ӛ�MC�Xc6Z��c��X,���������M�+��1�s*����lq㡋6���lӫJ� ���ء��%�l5ĉh)��M�57��7G��Мs�F�2!��;�:�t^s�)4��ȧcVm`�;Fw*�.>�3�Ӛ�K�}`�֐W^�m*uv�����kn&���rP��U.���E�KY�3��,w�ƽ&%S�;�c>�w*�2��4#���i���q�=�{�b��hj��%0(ȇ��knq�%t�Vx�R�[.�f������OknUM&^3�e��Մ�����]�<t���P����-Y� ����V�a%�qM����Ca�;/Zx1|+X+V�Ni�}���.мsH��������}����Lm��Chnm{Nlh�	Eea�����5�\�*�ʓ�������,�gkNC?3��5b�nL��47�����;(�f���Yp.6x*�.Ñy�:��#'$�/Fb0�����D�ȼz�f��k|�= |*��$��ƦE��//lh�DV�T�B���
?�F�4+��:Ht�B���6�ȝ�qC,ē�#�ұg��Jy��a�D7�jk�!����Fg��Dr��srk�Xt������~�wX�l0�[���k˻i�l��i�Q^�K[�vAЯ1��3˥�M��6�h"PPv�g�܎�iH����v��������s
�P_	��%����{��5J9^z��RaQ���qv㹳�0Ҝ9`T��T.�Dj��}PZ�{��Ey`b"éܐ�� �y�x�FxPʱ����u�!Bs��^��ht�(�{F�������k��3�a-��a��y,�&RAGo�pyB��g�8#_�?��r�}��zi�����v��ȬUK<�t��&�9���8C������R(��5k�a�D7�b��h�c��.0��F�f����/^��3�J      0   i  x��Աj$1 �~��]�l��\uE��#�K��`{ư��.�3�rB�\�paa�x�������G��{�W�5?J��i����ةrZ�K�ƴLO��e��q}��ܩ�|(^���	��t|j5��4�e������ן�u�;��B�V��(����a���JN�O��v��vT�N��Q��RN!Iq�N�N�,{�c���>3P ��j�j3M�x�#$�pb͎��ƣM��"y1�]L���0������m���� `��T�rŨ��]u��h��de_Z�WCkn�� ��A��;݆�q 'nK�gJECE�)��N�4ʃ#d�m������������H�      ,     x����n�@�{��C�$R466hN�fi�b��2j�l�`x�!Rfd��K�UR��T���+;-Ϧr,�n�K[c�9�_���r�J5�m��25.u��P�d��K=�W�	�U����#���h�zsQ^�{�ˍ� ]+`�?+����{Ԅ��`%O���؆�Sژ�zz�� ��My�M.�LX_��-v�0_e�:e�����a$�h}���̚z�/��p������}���5�q%`�xA�̊a�g�MK��V}��u�#P5�}ߜǋÌ���,��;��/�q�a\�L(���m�䨵�X3�����6ӒM	���^��"�����`mܢx�7�w��Č#!s���O�A�݇O{�(�Cb�z]������vg�b�뒶���)��oM�lƏ��� g�4b`���������;��.�⺸3m9���G�ҧ��U�,
wdѕr�
�D� �^FozuH=��0�����,���e�w[��(�2����
�_�E�bw�|q@E�/W�b��/(�������w�      .   �	  x��YKo�^[@����	@��]I�ҪU���$���&6aE(�I��(rA'�]�T'��M�:�H���/���%=�9w�!9J���4q$ͽs����,^]^�_W�W���6�W֋���rim{��^/�E�Z��_)~�У��Z.nV�����,Win�Y_w�U)V�i�Q���*mo��*m�Y*�~q��ǹ����X"�.ۖ����qKٱ\��ŭh"i�3���V?Tk��S��]o���}��O��nz{��tGyU�x;^M�u�h�����p���M4h�R�b���=�>�S��nj����AT�/�>�-}̛\� Ƿh]��{�F���Q-"�u���}=Eǵq�>��=�C���
+��/���A�_�e9?0J7�mK�觯�D��`kc�puKa�Ԥ���:||Uv`l���Ԧ߮��W�`/�3*���`I�=�I'Ҕ�䔴,"�!.�DސO�\	�0j�ٝ��:�����:�Sh���o��c��̉�0:�7�(�3V�|��U�r\�fM1)�Q�����O�&�$Dv��A�	.��"��0Hv@�qV����v�XP}cJD=ɸ��)t�=��N����X&�͒�/o��u�Tܨ�
kŵ҇S�9��[�.߰���}�Ưg_�['��:��e�i+�J'��GD�omX��=�&�'ͽ6�zu�7R$�!��K�R,�hٷ�+2����K���f-�������������)�Yf��8���-�z��K��c[�H��h;tԽ�����EɮY�	�=N�qVJ�!�<?�i=���sK�������e�b�!�z9zOM�=��2�l:e%�L�3�ҷ U�������@C� �gO�1��IIBЊ$t�L|��(V"a������D�3����]vT��`�Y���HhaϦs���]F�*�`���)#�)CZ@=Q�|� ;���]�F�^c�~lr��kf�2П#܁�ZL�2�X���À$
�%)��v
v4ǘ���q�Ĭ̹}�͗cX�i���l�	Y;̈́���t�B˅0�g��w��}�3�~C|��"Of!�?�A��Rv���ԛ7�~��_P�K�W����.3�;����h&���c/'\�,����h0 �dҜ\$�n!�x}��oD��c$�/�Sm{Z��\"���x,%! `���Yz�e��i�˯����i�9;��ٔ%�k�@?������~���>��c<|���Oh���g��������^�*����	�}����U����)>��2����ێZ^QW�7n���G��vys�Q׊7�҆�a篊��-�v`0���Wb�����4��0,;���\sI���e���D�~�*i#���0ӥ�#Vm�ߏ�F�D�_Iq�C8��+��1���9��!i=r��Tq'���6������	�K5&�+^��]&Y��Ԍ'&T[��-�&R��+�*�l�1�$��Y@���U�T�j��%U�ٖr�P>4A�Ѓ`�>E��]x%6���Ԍ�=԰=$m�⪌�~ƕ�h!P���1̷4���lLU�|�p���Z��_Ü��$\M�����^.�!��H��s5WB��q4�%�*˸)V#�P��y�+>��6k�\W�;h>��Eپ����cT�q�m��BF��.�&"�x���Wa���l�z���/a5��P��=��.{�?�������Z���o�����yu�@�&D
��,.I�%x�}�n���w]�#-�а��X�q�S�y��]F&�6�0g47V����N�:�*�Ru6w��k��c`�;�-���I��f�H� �W��ՀD,v�3�	�)R�'��f0�06 #Q1�5�$�oT���^���X��j�D��1C��Y_N��	%��}�uL���uNڄۊ��;��Y��nP�������aTP��� � �'`2���n[e�VT�o8��3�@T
q�>����9 @��i�T�;��k�� .�>c{M�SoG�R��?�K����D�OF�VW�J
>V @�:�&��7oU����V�w�����t�[�BY�!�l� 9Lf3Ȋ��\6�h��g����UH���v*�DS	���pD�/��/���G��%2��$�t��ȷ��ls�@��?��h�R.l�t���m�-S{�Un��Idb�Tjԃ�p��cY+b���7�X	�|�x��F���^T�.���}d��Lf�.�^���M=zfќ�NЍ��������8Ƭ'<٠�|\�u�����A�@�'}[�'��]�R*��#�$�yw9���k~F�Ӌ���'�V,������fP61u8��s�1��c����D�I�}���nTVg��i��8��M޸i���G"^?�n\s�+�V��(G�
g�˔�|��>�Jo�& �=�� ����,�NX�	B�B�������81�E�s�T.I8a۩8'ާ�x,��ev<��(��`0������i�^��� .���      2   Q   x���v
Q���W((M��L�+(�O)M.�ON,*Q��L�Q(H-*�ϋ3���)�
a�>���
F:
�:
FF��\\\ xz     