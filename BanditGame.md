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

ssh bandit6@bandit.labs.overthewire.org -p 2220












