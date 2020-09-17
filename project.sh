#!/bin/bash
if [ -n "$1" ]
then

case "$1" in

-help) echo "Авторы: Крюков Илья Петрович ИВ-822, Русманов Владислав Владимирович ИВ-822, Сысоева Анастасия ИВ-822" 
echo "Краткое описание проекта:"
echo "Данный скрипт при запуске с ключём "--help", либо "-h" выводит справку,"
echo "Если скрипт был запущен без ключей, то выводится сообщение об ошибке."
echo "При запуске данного скрипта с ключом -alnetin производится вывод всех сетевых интерфейсов,"
echo "с ключом -intuoff(...) производится отключение заданных сетевых интерфейсов,"
echo "с ключом -intuon(...) включение заданных сетевых интерфейсов"
echo "Все доступные аргументы:"
echo "Все доступные аргументы:"
echo "    --help"
echo "    -h"
echo "    -alnetin"
echo "    -intuoff"
echo "    -intuon"
echo "Примеры запуска:"
echo "    bash lab1.sh --help"
echo "    bash lab1.sh -h"
;;

-h) echo "Авторы: Крюков Илья Петрович ИВ-822, Русманов Владислав Владимирович ИВ-822, Сысоева Анастасия ИВ-822" 
echo "Краткое описание проекта:"

;;




-alnetin) ifconfig;; #вывод всех сетевых интерфейсов

-intuoff) if [ -n "$2" ] # отключение заданных интерфейсов
	then
		while [ -n "$2" ]
		do
		ifconfig $2 down
		shift
		done
	else
		echo "Too low arguments"

	fi;;

-intuon) if [ -n "$2" ] # Включение заданных интерфейсов
then
while [ -n "$2" ]
do
ifconfig $2 up
shift
done
else
echo "Too few arguments"
fi;;

-setip) if [-n "$2"] #Установка IP для определенного интерфейса
	then 
		if [-n "$3"]
then 
			ifconfig $2 $3
		else
		echo "Too few arguments"
		fi
	else
	echo "Too few arguments"
	fi;;

-setnm) if [-n "$2"] #Установка Mask для определенного интерфейса
then 
		if [-n "$3"]
then 
			ifconfig $2 netmask $3
		else
		echo "Too few arguments"
		fi
	else
	echo "Too few arguments"
	fi;;

-setgt) if [-n "$2"] #Установка Gateway для определенного интерфейса(надеюсь)

then 		
if [-n "$3"]
then 
			ifconfig $2 gateway $3
		else
		echo "Too few arguments"
		fi
	else
	echo "Too few arguments"
	fi;;





*) echo "Error argument" ;;
esac
shift
fi
