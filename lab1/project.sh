#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No arguments"
  exit
fi

if [ -n "$1" ]
then

case "$1" in

--help) echo "Авторы: Крюков Илья Петрович ИВ-822, Русманов Владислав Владимирович ИВ-822, Сысоева Анастасия ИВ-822" 
echo "Краткое описание проекта:"
echo "Данный скрипт позволяет выполнять различные действия с сетевыми интерфейсами,"
echo "Если скрипт был запущен без ключей, то выводится сообщение об ошибке."
echo "При запуске данного скрипта с ключом -alnetin производится вывод всех сетевых интерфейсов,"
echo "с ключом -intuoff производится отключение заданных сетевых интерфейсов,"
echo "с ключом -intuon включение заданных сетевых интерфейсов"
echo "ключ -setip устанавливает IP для определенного интерфейса"
echo "ключ -setnm устанавливает Mask для определенного интерфейса"
echo "ключ -setgt устанавливает Gateway для определённого интерфейса"
echo "ключ -kproc убивает процесс по занимаемому порту"
echo "ключ -netstatic отображает сетевую статистику"
echo "Все доступные аргументы:"
echo "    --help"
echo "    -h"
echo "    -alnetin"
echo "    -intuoff"
echo "    -intuon"
echo "	  -setip"
echo "	  -setnm"
echo "	  -setgt"
echo "	  -kproc"
echo "	  -netstatic"
echo "Примеры запуска:"
echo "    bash lab1.sh --help"
echo "    bash lab1.sh -h"
echo "    bash lab1.sh -alnetin"
echo "	  bash lab1.sh -intuoff lo"
echo "    bash lab1.sh -intuon lo"
echo "    bash lab1.sh -setip lo 127.1.2.3"
echo "    bash lab1.sh -setnm lo 255.255.255.0"
;;

-h) echo "Авторы: Крюков Илья Петрович ИВ-822, Русманов Владислав Владимирович ИВ-822, Сысоева Анастасия ИВ-822" 
echo "Краткое описание проекта:"
echo "Данный скрипт позволяет выполнять различные действия с сетевыми интерфейсами,"
echo "Если скрипт был запущен без ключей, то выводится сообщение об ошибке."
echo "При запуске данного скрипта с ключом -alnetin производится вывод всех сетевых интерфейсов,"
echo "с ключом -intuoff производится отключение заданных сетевых интерфейсов,"
echo "с ключом -intuon включение заданных сетевых интерфейсов"
echo "ключ -setip устанавливает IP для определенного интерфейса"
echo "ключ -setnm устанавливает Mask для определенного интерфейса"
echo "ключ -setgt устанавливает Gateway для определённого интерфейса"
echo "ключ -kproc убивает процесс по занимаемому порту"
echo "ключ -netstatic отображает сетевую статистику"
echo "Все доступные аргументы:"
echo "    --help"
echo "    -h"
echo "    -alnetin"
echo "    -intuoff"
echo "    -intuon"
echo "	  -setip"
echo "	  -setnm"
echo "	  -setgt"
echo "	  -kproc"
echo "	  -netstatic"
echo "Примеры запуска:"
echo "    bash lab1.sh --help"
echo "    bash lab1.sh -h"
echo "    bash lab1.sh -alnetin"
echo "	  bash lab1.sh -intuoff lo"
echo "    bash lab1.sh -intuon lo"
echo "    bash lab1.sh -setip lo 127.1.2.3"
echo "    bash lab1.sh -setnm lo 255.255.255.0"

;;

-kproc)
    kill -9 $(lsof -t -i4:$2);;



-alnetin) sudo ifconfig;; #вывод всех сетевых интерфейсов

-intuoff) if [ -n "$2" ] # отключение заданных интерфейсов
	then
		while [ -n "$2" ]
		do
		sudo ifconfig $2 down
		shift
		done
	else
		echo "Too low arguments"

	fi;;

-intuon) if [ -n "$2" ] # Включение заданных интерфейсов
then
while [ -n "$2" ]
do
sudo ifconfig $2 up
shift
done
else
echo "Too few arguments"
fi;;

-setip) if [-n "$2"] #Установка IP для определенного интерфейса
	then 
		if [-n "$3"]
then 
			sudo ifconfig $2 $3
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
			sudo ifconfig $2 netmask $3
		else
		echo "Too few arguments"
		fi
	else
	echo "Too few arguments"
	fi;;

-setgt) if [-n "$2"] #Установка Gateway для определенного интерфейса(надеюсь)

then 		
 
			ip route add default via $2
	else
	echo "Too few arguments"
	fi;;


-netstatic)
    cat /proc/net/dev;;


*) echo "Error argument" ;;
esac
shift
fi
