#!/bin/bash

confronto=$(ls | grep $1.tar.gz)
#attribuisco ad una variabile il valore di ritorno dei comandi ls + grep
if [ $# -ne 1 ];then  #condizione di verifica per vedere se gli argomenti passati  sono diversi da 1
	echo "Errore, hai inserito più di 1 parametro"
	exit 1
elif ! [ -d $1 ];then #condizione di verifica per vedere se l'argomento passato non è un directory
	echo "$1 : non è una directory"
	exit 1
else
	echo "$1 è una directory"
	echo
	echo "creo archivio con nome directory in input"
	echo
	if tar -czf $1.tar.gz $1 ; then
	echo "archivio creato con successo, il suo contenuto è:"
	#creazione directory con argomento passato  con comando tar -czf  c=crea archivio , z=comprime archivio con gzip, f=specifica node dell'archivio
		tar -tf $1.tar.gz #stampo contenuto directory 
	else
		echo "Errore"
			exit 1
	fi
fi
if [ "$confronto" = "$1.tar.gz" ]; then #confornto il valore di ritorno dell varibile creata la quale cerca l'archivio che ho creato in precedenza. 
	echo "Esiste già una directory $1.tar.gz"
	echo
	echo "Sovrascirvere?(1 = s1 , 2 = no)"
	read decisione #prendo in input un comando
	if ! [ $decisione -eq 1 ];then #se il comando che ho preso in input non è 1 esco 
		echo "Archivio non sovrascritto"
		exit 0
	else
		echo "Sto sovrascivendo archivio creato..."
		echo
		rm $1.tar.gz #rimuovo archivio creato precedentemente
		tar -czvf $1.tar.gz $1 #genero uno nuovo archivio con stesso nome
		echo
		echo "Ho sovrascritto archivio"
		exit 0 
	fi
fi



