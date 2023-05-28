PGDMP                         {            Shop    15.1    15.1 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
   TABLE DATA                 public          postgres    false    215   n9       *          0    49484    image 
   TABLE DATA                 public          postgres    false    217   �9       0          0    57668    orders 
   TABLE DATA                 public          postgres    false    223   �>       ,          0    49491    person 
   TABLE DATA                 public          postgres    false    219   �?       .          0    49500    product 
   TABLE DATA                 public          postgres    false    221   RA       2          0    57675    product_cart 
   TABLE DATA                 public          postgres    false    225   KU       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 65, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 5, true);
          public          postgres    false    222            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 4, true);
          public          postgres    false    218            C           0    0    product_cart_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.product_cart_id_seq', 8, true);
          public          postgres    false    224            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 13, true);
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
       public          postgres    false    219    225    3210            (      x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01���ۀ�2�01�b�Ŧ�.l���b����b녽v\�1�� �6VG      *   �  x���K��5���+�N��&I]���m+I*Z����7-���;���x���=U�������}����n����Η����u��5����o�?������_�?��_^���_}���?�>/����']��r��J}�Em�l�<�Ky��������/�}���@ʒ6�U&a�Ӧ��Օ�-OD���9P�$�%HRyr�9�*29o�~��Ö�5��N$=/�!�Fc�Խ��y��eͬe���d#U
5�c�_�i�d����Lm�IRʤ�6�nᒻ뽗�2� Y�蒊�����b�^F�]��'"ȴ�L��̋dƤ�Mh�����=>ב�R]_"�؊�TYM�}��E:��s��aue�Z��$k-�bNV�ͽ��{|�#�}���35J�H�\AMK��x{����{/�e�O�f�G��3����x�̍g�Z�(OD��C[T*�1�׆/��*+�(<��<�Iu��ؠu2C��F�N����u��s)�>{�ɑص6��'nY��{�1���sy�SS�}�,���)�繨ou_'��K��<�Y�9ڜ�19��T�Ɩ��H"�s=�fɰ��kT�}z�m+�/�����=>ב�>-ו�%����nAcF'W����|��u�Odu��)Y)$��#�l�e[�S��>ב�>V��B�g#�bXD��,�2J~L��.3�~���mA����٩X��Eز>�y�c���n���B\�*֟<F����	�# kY�N��j���c��9E�	����s���@���C�93�L�b��SN�1��,��=��� ���[�׸:�wQ'����j]uǣ��2�8h���%�D�6;g%7���R�n��d	�w�����g H=P6���.؎�=2t�y,4Ljk�cW�DA��h����1�}V��<�9�-W���s)Lej 7�*�����u��D�����i�F�K��FM��fl��s�A�e�Q۽��L��	J�c�B�W��<zL�ñ��҂��	.�R��!8)��|3�󁻶)v.���L��vе�3ѓ
��"��%�b�h����-DYT߁W�V��mC��u4?Ot����V��!F��-�e�Q��9N�l���#K�R[i&��L�Q�b8cV2�x��z�_�t<��C=Bt�yTT��d ������v+��L=�<Tt��o���r c���q��#�l��&��S�a�{�/C�.Y      0     x��ѱj�0�=Oq[���tgK��!C��Ф]�-9`h����_�m�d1hНt�f�[��a�ݿ�e�>��j�XwWX4QAh�s� �}}�S��<���Sp隐�k_��5�i�=ƙK��!�龄����FA:sB�E��@�B�9w���yeQSEQ��X�#���u�>��韵�{)�˧�f��c� ���M��;�L�=DȽ����t�� Ă���"���$����4��k�S��u��
Y�a����Ÿ�C���z�C��$~c����8      ,   G  x���Io�Pཿ�����1���P�(�����&��(��61�I�vws�s��"Á�K!�5���E-���ꊚ��*�,��Tt]_�נ��dFy���CM���q�W��1f�1`ƍb�˯�z�WV�ş TDU�h��c��������_���?}��໸Ց1����C0�G��e�`�͡�b)�*��:��#[���-"[�#y0 ��E�ں�eU������]���ݹ��\��}zM��IyUR�hʘ�]�Xɺ���S���`�J�"��g{s�;�z�|��.��F��������}�ECZ0)!����-�`��_��7y(�x      .      x��[]oǱ}�����"������>	���C����/�"	�2H�߸KQ�.m1�}�ı�ȾA ��9�1ÿ0��nթ����%#�a���3=��U�N������7��n���[��`�^��͇�?����nܯ��w������:�s}�����߯�67�ѵ���7kn{c�}������>�p��y����͏~�q�����q�mw�Ss?n5Z����R�횝��jwy����huVL�f/��,ʒl����c�:��e/���n6�/���l�ϲS�0��G.{�}�}Ys�>]��C�����oR}.���n�e%��.����_4ߙ�����{٧���k]�i��Z+��|ou��S��l0?���&3��
�Ѽ���-aBh�d~��_��"�]���#����I���?�C�U�r\6��c�n���-�O3���!�zBf�GYJ����n����l)�k�I�l�:��J���3�U�4���	M����w�=�҅������L�@v��X�(o��YӀl��SzE̷����c�4gr�k��/�o~ǐ��x�|�a�>]Ja(��7�d1Y�)/1��aT2փq�v�L4���;��X;=�`k�Vv�LH�"+��<�̛$�W����<�U�k�iNG<�)�����mf��#2��?���ؽ��0;G�l�݌�j�ݧ߉�>�#}�d�}�G|�x�),�(�c�C|�����z<H_�0w�)���r�A���#�f��/@�bp��>u|32�U�w�G�ͼ�䏴6���>��	��&}��"(���`������ KKi����H��C�����UX'����=��p�p1�������x��x��A+�O���}�I�M�%�07�7}�H"F�%�?�h�D�Î���D��yJ��W�(���I��a�����g�����A��ǃ��|�e�( ����<�-��gZ�[@^���������E��_���qH��%O Y`��ʼ; �X�g��%
q�E���;��'�IC�[�{&kg�b���9�)CeI������{|Q��,���(O��ŉe��3� Q~ߟ)	�̾��Ry/�Ch���c��N��J�V�p�sJ��y�.�'�ŉ�a5(Ⱦ=l{��|��B���qWwC�u �k�>�I��ck�wz�;Ґ��p��O1� ��8�h��ϙ�\������<%��I#�.����eO��x��m�B��坉 ��>���b5#r�eS��^^i]o�[D�b���#����Z�=�ou�U~��l��:��Z�GW�)�VZ����#�`���$<��1M��5��R�ּ�_Wn}�l{�ʶ׺�V�Ad���4/#���`�:\p�ց:,�24ۏ��=��EkF�2�XT%�K\� �����HE�!#�Ԝ�R~,�S��"<�-�;J]�;�9ѡ8�f̼��H� 4h�=<�3ʕ�M�>��*c#p`{
��L�_�Ft��(��'F��h�_
Q{��4�'$��3�X���{ű��	H���F��+���&����I9���r����`��/��:%A�/8�䃦��"Ç˧�sPf��b�0��_e2l	e2ajr���j+��S���jq��0�\�D�7���<�F�94����Y�'z��",&���K|�j� �բ�"��=�?d�y�j�@����ჲ��zsO&����V-b@�d#a��+G��Xk���
u�061B��w 3�V꒻ 	��=�R�lމI�=uNS��ZN�,O��W�*�j�@��A.�U���䵀e/cY�5�$�n4��D������nd!����&[_/e��n��m5����j�:���)쮘9�:5wL
¥��=l��$����TU��94ԔZk���?�Rdr�>5p��w3��p� G\�� ��%���%��P�ţ=�Ra4� ��"F��.�g-��sŃ�"�����6�B�>�w�2�*L�i"�0��ep�-��v��N���:�J��Oxd0%�:�S��Ą���՜�[�t(��yT�K�َ��q�<�		�[l�s��,��(��7nM<�L��*Q�R���|��R�$b�R�9.`2_�5P5�Ǣ-�e��;7ߠ���S�)"��E�`���gh. ξ/@N�Ԏ���͵��Z9#��+��S�' ��J�����]�CJ��d�s��D���5�\>�r�khe�D�"%�n'X%�%gx��hR�6Q�!Q	�w�j�U��ǈ-�Ox[���L��r�o�Z��*�W�0=��2ş�G,�j�o�3��AU>��h��*�H-!alu���1"`\��/ҫ���8Љ�~����/,�R4$�@9�ͪ�=�?�/����m�.J��0��7��(q�����cI���l����~�O��%N%�Q
��;�����N"03�:S��W�f_z����U���y�a�,���Q,@b�}��a!n,1���݀�ߥ�T3N 7�w�f0�����߲���19s� Jp{�=�$Bz��RXg�/@ڢ!��l}x����V73Ԅ4*�K��k�Ꙅ�������y��.���L�0� ���1P��DbQRjoJw�"��Le�v�d>͖����G0"F�kg���<�q�/w����V��+�v%�0i�������+q��=�lyOm}�<u��S��V��n6[+r��p?XQ�B!�{�8�;�]"��%Q��Ŝv$~�.94~��Yɪ���w�����@
h|�gJ�!�L'��LZ���$oj�42�\�q�ɼW�d+�q�x���pQ���E(�/P��!{�u�_��|Ah��j�f�񟌬|��+�y��Xz�)ٔu�	Atɤ�J)+[�MIY������fƥ���)#v�-�	�T�<��`����J?#�S��#U�)�r�2`���*�h���3��_z��f�2�Sס��grb�<g��k�� E�+U5� -
�O�֞;#ā��s;6�H&�<?l���ԓ~��$�g�HZ�mZS�H4T���J��"��wIɱW�By�D��_��\@�//5&`D��Zy���t���+=k(1��$�T��/�.����3� ͧ�ƾ�F����qEAzk�U��G>N��
F[Dʅ��,
$r���X��?��j����Q,�@x	"y��<THŬ��]�T�����J;�ZDMd��)~^.-Um\aV��w�a�ERI%�I`V��ip,!%�m�����6�0(Z���+b���v�@��M�)����b���\��ݚ�ř�6z*Z<����='�Py_�*�+>H�K,Rdi�|�v��N��"5��F3�>� �,m���=��~�>���O�{�
?��lT�S�ۺ^_^n��-���Sj^�NP^��f�ӈH�{��6i[4`����$�W����:�ǵ�?�zE@�K+å$���'����k�C���ZBR8OD�Q<�5��cc9�9��ĉ��M��zB?���e�l,G�Dl���fωS�	��3B����>�M�{���-�K�/?�kV}��m/�[���fG���V�Y�]��S;�Q$?�k��s��ꑢ�I(|SM��D{��k,)���M�*"�L�e� ��~�������T �*�������\�^/'��n'f)��7C�k{@����H&\OD�8�AW&κŒA$#,Z��;om�����hVO����Cz���H_@﫿��)l��-����S���>EN�Y�F>��z���!���p�S��1h}�QO�b12�f�J���F4N+�zӺ�H�H}��k?՜8�35�W�}x�Sa���LE�(I�/��!�.��L)����.F��W��'34���B�~OO`��9���
c��T��J�:b%����F
�1��s��
G�*������~�������#oߌ$'H���Y�G��c�{�y[�R��� �6�^�3d+e��y+�m���^��I_*��4�6*Ҝ�(@ƽhX?�5L��5/L� �  �.E��Ki��`��׬�X[�8+�����nnl���T��^Ȣ��N��n����r�]����7��z��9����V5�-wۭ���J�#��h���L|؁֙w�ʑ�qL�	�����Zi����{ן�W�8��H`�gM����n��ⲏ�
}���f�9-��*��8��4B�R񠛊] G�T�}�yߚ�[�$�.����;|i�-4=��7k����'Ѕ���\��Iϧ�B|�R�uʅ�탌�	�Ã��Kd�%�q�HY�	4�3�k��VL3Rx�-� ��s�ڳ�Kr4��fV�����P��i !3�R�d�@�Ώ�  ���^W�:�X����lI\���U�L����q2�$�v(�ym��_��ul2�����+������M���* ��m0��+���!҇Г�CI٬vu����wȺD�4��	��S���ˇX��yI��ؒ�nЅ��o�3�Blg�F�C�c�d�kV��VD_X?S^@�O�"q�uu�����G���J��v�`��o8٦]�6�n�Sot���5��\]�� h�
>̬7�y�ƛ�h��Z�MZ����m^W��#������(!/q��bV��M��KR��?�b�l&���>��'L�W�m��{zp�ʗ���H֡j���e2��~�P:�y����t��a_�t�� ���S��Fr�����cab��SNG0�07< jj��*�,�ǆO�����AC g��2�
v�'i������~!cLP��y_��qi)�t#DBN,"����/1���F����%�~��Qa������sʿ-+�����j�,��!b/ *��L�ɼbӰ�6+���	��	̤GA�g�	���s�G��w�kǓu��K�+����3��'�,ȟhƱ��~(V ��D;X~t�4�sw9`ثV����z�cA�v��\�T�R�����`�go�X��p?s�Vsy�Ѽ���ʕ����      2   
   x���         