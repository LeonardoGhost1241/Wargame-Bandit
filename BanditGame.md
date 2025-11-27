# Juego Bandit - Over The Wire 


(https://overthewire.org/wargames/bandit/bandit0.html)






### Nivel 1
Para ingresar al primer nivel usamos el comando ssh 

ssh banditX@bandit.labs.overthewire.org -p 2220     Donde X es el nivel 

Opciones mas comunes de ssh 
-l	Especifica el nombre de usuario al que se quiere conectar.
-p	Indica el puerto a usar para la conexión (por defecto es 22).
-i	Permite usar una clave privada específica para la autenticación. (ssh -i /ruta/a/clave usuario@servidor)
-v	Habilita modo verbose, mostrando información detallada sobre la conexión.
-X	Permite el reenvío de sesiones X11, útil para ejecutar aplicaciones gráficas.
-A	Habilita el reenvío de agentes, lo que permite el uso de claves SSH en el servidor remoto.
-C	Activa la compresión de datos, lo que puede acelerar la transferencia.
-o	Permite especificar opciones de configuración como en el archivo ssh_config.

Para poder ver el archivo "readme", basta con usar el comando 

```
    cat readme
```

Password: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If


### Nivel 2
El archivo se llama "-", por lo que para abrirlo podemos especificar la ruta absoluta del archivos, suponiendo que este se encuentra en /var/-, el comando seria 

```
    cat /var/-
```

Password: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx

### Nivel 3
Para este nivel, la password esta en un archivo que se llama "--spaces in this filename--", podemos usar la ruta absoluta como lo hicimos anteriormente

```
    cat ~/--spaces in this filename--
```

Password: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx


### Nivel 4
Para este nivel, el archivo donde esta la password esta alojado en un archivo oculto, lo que quiere decir que hay un archivo el cual su nombre comienza con un ".", por lo que si en primera instancia no lo vemos, podemos usar cualquiera de los dos siguientes comandos:

```
    find
```

```
    ls -la
```

y para ver el contenido de este, solamente usamos cat, seguido del nombre literal, por ejemplo:

```
    cat ...Hiding-From-You
```

Passsword: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

### Nivel 5
Para este nivel debemos de encontrar que archivo es leible por humanos, por lo que usaremos el comando file para determinar el tipo y ver que archivo es leible, para ello usaremos elsiguiente comando:

```
    file ./-file0[0-9]
```

Como los nombres inician con el caracter "-", usaremos la ruta absoluta para que pueda interpretarlos bien 

En dado caso de que hubiese hasta el numero 10, la forma de declarar el rango, seria con las {}, como file ./-file0{0..10}


Password: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw


### Nivel 6
Para este nivel nos piden encontrar entre muchas carpetas el archivo que contenga las siguientes caracteristicas:

    * human-readable
    * 1033 bytes in size
    * not executable

Para ello usaremos find con las siguientes opciones:

```
    find . -readable -size 1033c ! -executable
```

o podemos usar tambien los comandos: 

```
    find . -readable -size 1033c ! -executable -exec cat {} \;

    cat $(find . -readable -size 1033c ! -executable)      
```

En ambos casos, se estaria haciendo lo mismo


Password:HWasnPhtq9AVKe0dmk45nxy20cvUa6EG


### Nivel 7
Para este nivel tenemos que buscar el archivo en todo el servidor el cual que contiene la password, sus atributos son los siguientes:

    * Owned by user bandit7 
    * owned by group bandit6
    * 33 bytes in size 

Para ello usaremos el siguiente comando:

```
    find / -user bandit7 -group bandit6 -size 33c 2>/dev/null -exec cat {} \;
``` 

Password: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

### Nivel 8
Para este nivel tendemos un archivo llamado "data.txt" el cual tiene muchas passwords, pero la que nos interesa esta precedida con la palabra "millionth", para ello podemos usar dos comandos de coincidencias, los cuales son: 

```
    grep "millionth*" data.txt
```

y tambien:

```
    sed -n "/millionth/p" data.txt
```


Password: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc


### Nivel 9 
Para este reto en el archivo llamado "data.txt", sin embargo es la unica linea unica en todo el documento, para ello usaremos el comando uniq, donde las opciones mas comunes y usadas son:

    *    -c: Precede cada línea de salida con el número de veces que aparece.
    *    -d: Muestra solo las líneas que son duplicadas.
    *    -u: Muestra solo las líneas que son únicas (no duplicadas).
    *    -i: Ignora diferencias de mayúsculas y minúsculas al comparar líneas.

Para que el comando uniq funcione correctamente al eliminar lineas, debe de estar ordenado y para ello se usara el comando sort, el cual ordena, las opciones mas comunes de este comando son:

    *   -r hace que la ordenacion sea de forma inversa
	*   -n ordena en base a una informacion numerica 
	*   -h ordena en magnitudes humanas, como megas, bytes o gigas

Por lo que usaremos el siguiente comando que primero ordena y despues elimina las lineas duplicadas

```
    sort data.txt | uniq -u                                                                │
```

Password: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM


### Nivel 10
Para este nivel la password esta alojada en un archivo llamado "data.txt" el cual no esta legibre por humanos. Para ello se usa el comando strings, el cual utiliza en sistemas Unix y Linux para extraer cadenas de texto legibles de archivos binarios, algunas opciones mas comunes son:

    *	-a	Analiza todo el archivo, incluyendo áreas que normalmente están omitidas (por defecto, solo analiza las secciones de texto).
    *	-n <n>	Especifica la longitud mínima de las cadenas a imprimir. Solo las cadenas con al menos n caracteres serán mostradas.
    *	-t	Imprime el tipo de archivo antes de listar las cadenas.
    *	-e	Permite especificar el delimitador de salida entre las cadenas (por defecto, espacio).
    *	-o	Almacena las cadenas encontradas directamente en un archivo.

```
    strings data.txt | grep "="
```

Password: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey


### Nivel 11
Para este nivel, en el archivo "data.txt" contiene una cadena que esta en base64, las opciones mas comunes de base64 son:

    * -d, --decode	Decodifica el texto en formato Base64 a su representación original.
    * -i <file>	Especifica un archivo de entrada (si no se usa, lee de la entrada estándar).
    * -o <file>	Especifica un archivo de salida (si no se usa, muestra en la salida estándar).

Para decodear el archivo usamos el comando:

```
    cat data.txt | base64 -d 
```

Password: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr

### Nivel 12
Para este nivel debemos usar el comando tr, el cual susituye carcater por carcater, osea 1:1. Dentro del archivo "data.txt" tenemos la siguiente cadena:

```
    Gur cnffjbeq vf 7k16JArUVv5LxVuJfsSVdbbtaHGlw9D4 
```

Nos piden usar ROT13, el cual se refiere en mover cada carcater a la 13va posisicon del alfabeto, por ejemplo, la "A" a la "N" o la "B" a la "O", por lo que usamos el comando tr como:

```
    cat data.txt | tr "A-Za-z" "N-ZA-Mn-za-m"
```

Password: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4



### Nivel 13   ------  PENDIENTEEEEE
Para este nivel tenemos un archivo que contiene la salida hexadecimal del archivo que queremos leer, para poder hacerlo, primero debemos de convertirlo de hexadecimal a binario y despues descomprimir el archivo

Usaremos xxd para crear un archivo binario, para ello usamos

```
    xxd -r -p data.txt > data.bin
```

Despues de ello descomprimimos el archivo, para saber que tipo de descompresion usaremos tendremos que ver 


COPIAR SCRIPT REALIZADO



Password: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn



### Nivel 14 
Para este nivel no nos dan una password, sino que nos dan una clave privada, la cual debemos de loggeranos, para hacerlo ejecutaremos el siguiente comando:

```
    ssh -i passSsh -p 2220 bandit14@bandit.labs.overthewire.org
```

Nota:Hay que tener en cuenta que no nos podremos conectar si los permisos de la clave son diferentes a 600 o en formato simbolico, u=wr,g=,o=


Password: 
-----BEGIN RSA PRIVATE KEY-----                                  
MIIEpAIBAAKCAQEAxkkOE83W2cOT7IWhFc9aPaaQmQDdgzuXCv+ppZHa++buSkN+ 
gg0tcr7Fw8NLGa5+Uzec2rEg0WmeevB13AIoYp0MZyETq46t+jk9puNwZwIt9XgB 
ZufGtZEwWbFWw/vVLNwOXBe4UWStGRWzgPpEeSv5Tb1VjLZIBdGphTIK22Amz6Zb 
ThMsiMnyJafEwJ/T8PQO3myS91vUHEuoOMAzoUID4kN0MEZ3+XahyK0HJVq68KsV 
ObefXG1vvA3GAJ29kxJaqvRfgYnqZryWN7w3CHjNU4c/2Jkp+n8L0SnxaNA+WYA7 
jiPyTF0is8uzMlYQ4l1Lzh/8/MpvhCQF8r22dwIDAQABAoIBAQC6dWBjhyEOzjeA 
J3j/RWmap9M5zfJ/wb2bfidNpwbB8rsJ4sZIDZQ7XuIh4LfygoAQSS+bBw3RXvzE 
pvJt3SmU8hIDuLsCjL1VnBY5pY7Bju8g8aR/3FyjyNAqx/TLfzlLYfOu7i9Jet67 
xAh0tONG/u8FB5I3LAI2Vp6OviwvdWeC4nOxCthldpuPKNLA8rmMMVRTKQ+7T2VS 
nXmwYckKUcUgzoVSpiNZaS0zUDypdpy2+tRH3MQa5kqN1YKjvF8RC47woOYCktsD 
o3FFpGNFec9Taa3Msy+DfQQhHKZFKIL3bJDONtmrVvtYK40/yeU4aZ/HA2DQzwhe 
ol1AfiEhAoGBAOnVjosBkm7sblK+n4IEwPxs8sOmhPnTDUy5WGrpSCrXOmsVIBUf 
laL3ZGLx3xCIwtCnEucB9DvN2HZkupc/h6hTKUYLqXuyLD8njTrbRhLgbC9QrKrS 
M1F2fSTxVqPtZDlDMwjNR04xHA/fKh8bXXyTMqOHNJTHHNhbh3McdURjAoGBANkU 
1hqfnw7+aXncJ9bjysr1ZWbqOE5Nd8AFgfwaKuGTTVX2NsUQnCMWdOp+wFak40JH 
PKWkJNdBG+ex0H9JNQsTK3X5PBMAS8AfX0GrKeuwKWA6erytVTqjOfLYcdp5+z9s 
8DtVCxDuVsM+i4X8UqIGOlvGbtKEVokHPFXP1q/dAoGAcHg5YX7WEehCgCYTzpO+ 
xysX8ScM2qS6xuZ3MqUWAxUWkh7NGZvhe0sGy9iOdANzwKw7mUUFViaCMR/t54W1 
GC83sOs3D7n5Mj8x3NdO8xFit7dT9a245TvaoYQ7KgmqpSg/ScKCw4c3eiLava+J 
3btnJeSIU+8ZXq9XjPRpKwUCgYA7z6LiOQKxNeXH3qHXcnHok855maUj5fJNpPbY 
iDkyZ8ySF8GlcFsky8Yw6fWCqfG3zDrohJ5l9JmEsBh7SadkwsZhvecQcS9t4vby 
9/8X4jS0P8ibfcKS4nBP+dT81kkkg5Z5MohXBORA7VWx+ACohcDEkprsQ+w32xeD 
qT1EvQKBgQDKm8ws2ByvSUVs9GjTilCajFqLJ0eVYzRPaY6f++Gv/UVfAPV4c+S0 
kAWpXbv5tbkkzbS0eaLPTKgLzavXtQoTtKwrjpolHKIHUz6Wu+n4abfAIRFubOdN 
/+aLoRQ0yBDRbdXMsZN/jvY44eM+xRLdRVyMmdPtP8belRi2E2aEzA==         
-----END RSA PRIVATE KEY-----                                    


### Nivel 15
En el anterior nivel nos dijeron que el archivo  "/etc/bandit_pass/bandit14" podra leerse por el usuario de este nivel, por lo que la password de este nivel es "MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS", y para obtener la password del siguiente nivel nos piden conectarnos al "localhost" en el puerto 30000 y enviar la password, para hacerlo, ejecutamos el siguiente comando: 


```
    echo "MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS" | nc localhost 30000
```

Opciones mas comunes de nc:
-l	Escuchar en lugar de conectarse (modo servidor).	nc -l -p 1234
-p <puerto>	Especificar el puerto para escuchar o conectarse.	nc -p 1234 localhost
-u	Usar UDP en lugar de TCP.	nc -u localhost 1234
-v	Modo verbose; imprime información detallada sobre la conexión.	nc -v localhost 1234
-w <segundos>	Establecer un tiempo de espera para conexiones.	`echo "Hola"
-z	Escaneo de puertos (modo "cero"). No envía datos, solo verifica la conexión.	nc -z -v localhost 1-1000
-k	Mantener nc en ejecución para manejar múltiples conexiones (modo servidor).	nc -l -k -p 1234
-n	Evitar la resolución de nombres de host; usar solo direcciones IP.	nc -n 192.168.1.1 1234
-e <comando>	Ejecutar un comando y redirigir la entrada/salida a través de nc.	nc -l -p 1234 -e /bin/bash
-i <segundos>	Intervalo entre conexiones cuando escanea puertos.	nc -z -i 1 localhost 1-1000


Password:8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo


### Nivel 16
Para resolver este nivel, podremos usar dos opciones de comandos, lo que nos piden es conectarnos a un servicio que esta usando el protocolo SSL/TSL, con la misma password que usamos para loggearnos, debemos de hacer una peticion al servicio que esta corriendo en el puerto 30001, podemos usar openssl o ncat para conectarnos, antes dar las opciones, mostraremos algunas opciones comunes para cada comando: 


Opciones de openssl 
genpkey	Generar claves privadas.
req -new	Crear una Solicitud de Firma de Certificado (CSR).
req -x509	Crear un certificado autofirmado.
x509 -text	Mostrar información de un certificado.
enc	Cifrar y descifrar datos.
s_client	Conectarse a un servidor HTTPS y mostrar información.
s_server	Crear un servidor SSL simple.

Ejemplos:
Generar una clave privada: openssl genpkey -algorithm RSA -out private_key.pem
Crear un certificado autofirmado: openssl req -new -x509 -key private_key.pem -out certificate.crt -days 365
Ver informacionde un certificado: openssl x509 -in certificate.crt -text -noout


Opciones de ncat 
-l	Escuchar en un puerto (modo servidor).
-p [puerto]	Especifica el puerto a escuchar.
-u	Usar UDP en lugar de TCP.
--ssl	Usar SSL/TLS para conexiones seguras.
-e [comando]	Ejecutar un comando después de conectar.
-v	Modo de salida verbose, mostrar información adicional.
--help	Mostrar ayuda y opciones disponibles

Ver ejemplos en pagina de manual 1 de ncat, con man ncat 1 


```
    echo "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo" | nc --ssl --verbose localhost 30001
```
Usamos verbose para mostrar mensajes de negociacion del handshake TLS

```
    echo "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo" | openssl s_client -connect  localhost:30001 -quiet 
```
Usamos -quiet para no mostrar mucha informacion sobre el handshake del protocolo TLS

Password:  kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx



### Nivel 17 
Para este nivel nos piden enviar la password de este nivel dado un rango de puertos, 31000 al 32000, para hacerlo podemos ejecutar un script o simplemente ejecutarlo desde la terminal con la siguiente linea de comando

```
    for p in {310000..320000}; do echo -e "Puerto $p\n" ; echo "kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx" | ncat --ssl localhost $p 2>/dev/null; done  
```

Esta linea nos permitira ver todos los resultados de cada puerto

Password: 
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----


### Nivel 18 
Para este nivel, en nuestro directorio home, tenemos dos archivos, los cuales parecen ser los mismos, sin embargo, hay una linea que es diferente, para ello usaremos el comando diff, antes de mostrar el comando usado en este nivel, repasaremos algunas opciones mas comunes de dicho comando

-u	Muestra las diferencias en formato unificado.
-c	Muestra las diferencias en formato contextual.
-i	Ignora las diferencias de mayúsculas y minúsculas.
-w	Ignora los espacios en blanco.
-b	Ignora las diferencias en la cantidad de espacios en blanco.
-r	Compara recursivamente directorios.
-q	Muestra solo si los archivos son diferentes.
-s	Muestra un mensaje cuando los archivos son idénticos.
--color	Resalta las diferencias utilizando colores.


 ra poder ver las diferencias de los dos archivos, usamos:

```
    diff passwords.*
```

Podemos usar tambien el siguiente comando para una salida mas amigable:

```
    diff -u passwords.*
```

Tomaremos la password de la diferencia del archivo passwords.new 

Password: x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO


### Nivel 19 
Para este nivel, solo tendremos que leer el archivo "readme", sin embargo al intentar loggearnos, nos expulsara de la sesion, pues en el archivo .bashrc se encuentra la linea:

```
    echo 'Byebye !'
    exit 0
```

Por lo que no podriamos iniciar una terminal, para resolverlo, podemos usar el mismo comando ssh para poder ejecutar instrucciones dentro de la maquin, para ello simplemente pondremos el comando que deseamos ejecutar al final de este, por ejemplo, para poder ver los archivos


```
    ssh -p 2220 bandit18@bandit.labs.overthewire.org "ls -l "
```

Para poder leer el archivo "readme" usaremos el siguiente comando:

```
    ssh -p 2220 bandit18@bandit.labs.overthewire.org "cat readme"
```

Password: cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8



### Nivel  20
Para este tenemos un archivo ejecutable "bandit20-do" que tiene el SUID bit, por lo que si lo ejecutamos podremos usar los mismos privilegios que tiene bandit20, por lo que la password del siguiente nivel se aloja en el archivo "/etc/bandit_pass/bandit20", para poder ver el contenido de este archivo, hay que ejecutar el archivo "bandit20-do"

```
    ./bandit20-do cat /etc/bandit_pass/bandit20
```

Password: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

### Nivel 21 
Para este nivel tenemos un archivo llamado "suconnect" el cual sigue los siguientes pasos:

1. It makes a connection to localhost on the port you specify as a commandline argument. 
2. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). 
3. If the password is correct, it will transmit the password for the next level (bandit21).

Podemos hacelo con una terminal o hacerlo con dos terminales divididas, osease, con tmux, mostraremos primero con una terminal, el comando que nos permitira primero ponernos a la escucha es el comando nc, por lo que lo pondremos a la escucha y antecediendole la password del nivel anterior, y ademas ejecutandolo en segundo plano, para ello usaremos el simbolo (&) al final del comando, tal que asi:

``` 
    echo "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" | nc -lnvp 4444 &
```

Despues de ello, simplemente ejecutamos despues el programa mencionado al inicio

```
    ./suconnecct 4444
```

y nos mostrara las dos passwords, la del anterior nivel y la nueva.
Para la siguiente parte, simplemente usaremos tmux, dividiendolo en dos ventanas, para ello seguiremos el siguiente proceso

1. tmux
2. Ctrl + b - %
3. En una terminal ejecutaremos lo siguiente: ``` echo "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" | nc -lnvp 4444  ```
4. Ctrl + b - flecha derecha 
5. En esta terminal ejecutaremos lo siguiente ``` ./suconnecct 4444 ```
6. Nos mostrara las password del siguiente nivel

Password: EeoULMCra2q0dSkYj561DX7s1CpBuOBt


### Nivel 22





ssh -p 2220 bandit20@bandit.labs.overthewire.org 


















