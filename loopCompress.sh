#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "[!] Algo salio mal...."
	exit 0
fi

xxd -r "$1" file

arch=file

if [[ !  -e "$arch" ]]; then
	echo "No se genero el archivo.."
	exit 0
fi

#dir=$(mktemp -d )
#cd $dir


withNumber(){
	binfile=$(ls *.bin 2>/dev/null | head -n 1)
    	if [[ -n "$binfile" ]]; then
        	arch="$binfile"
    	fi
}


while true; do
	
	tipo=$(file "$arch" | grep -io "gzip \| bzip2 \| tar \| ascii" | tr [:upper:] [:lower:])

	#echo $tipo

	#if [[ -z $tipo ]]; then
	#	echo "[!] Variable sin valor"
	#	exit 0
	#fi

	case $tipo in
		"tar")
			mv "$arch" "file.tar" && tar -xf "file.tar" 

			withNumber

			if [[ $? -ne 0 ]]; then
                		echo "[!] Error al descomprimir file.tar"
                		exit 1
            		fi
			;;
		"gzip")
			mv "$arch" "file.gz" && gunzip "file.gz"
			
			withNumber
			
			if [[ $? -ne 0 ]]; then
                		echo "[!] Error al descomprimir file.gz"
                		exit 1
         		fi
			;;
		"bzip2")	
			mv "$arch" "file.bz2" && bunzip2 "file.bz2"

			withNumber

			if [[ $? -ne 0 ]]; then
                		echo "[!] Error al descomprimir file.bz2"
                		exit 1
            		fi
			;;

		"ascii")
			cat "$arch" && exit 0 ;;
	esac


done


