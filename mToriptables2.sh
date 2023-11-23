#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 8);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=8;fi
 if [[ $aa -gt 8 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=8;fi
 if [[ $j1 -gt 8 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 8 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=27; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** Toriptables2 ***\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[5;3H\e[2m Скрипт Tor Iptables — это анонимайзер, который настраивает iptables и tor для\e[0m";
 echo -en "\e[6;3H\e[2m перенаправления всех служб и трафика, включая DNS, через сеть Tor.\e[0m";
 echo -en "\e[7;3H\e[2m После запуска TorIptables2,\e[0m";
 echo -en "\e[8;3H\e[2m каждое сетевое приложение будет делать TCP соединения через Tor.\e[0m";
 echo -en "\e[8;3H\e[2m Ни одно из приложений не сможет через прямое соединение раскрыть ваш IPадрес.\e[0m";
 echo -en "\e[9;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[12;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[13;3H\e[2m Опции\e[0m                                                              \e[36m OPTIONS\e[0m";
 echo -en "\e[19;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[21;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[23;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[24;3H\e[2m Git:    \e[0m https://github.com/ruped24/toriptables2";
 echo -en "\e[25;3H\e[2m Author: \e[0m Rupert Edwards";
 echo -en "\e[26;3H\e[2m License:\e[0m GPLv2";
 echo -en "\e[28;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[10;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[11;3H Использование                                                        \e[32m USAGE \e[0m";}
  E2(){ echo -en "\e[14;3H Show this help message and exit                                  \e[32m -h --help \e[0m";}
  E3(){ echo -en "\e[15;3H Перенаправления всего TCP трафика через сеть Tor                 \e[32m -l --load \e[0m";}
  E4(){ echo -en "\e[16;3H Выходить в Интернет не используя сеть Tor                       \e[32m -f --flush \e[0m";}
  E5(){ echo -en "\e[17;3H Изменит схему и даст новый IP-адрес                           \e[32m -r --refresh \e[0m";}
  E6(){ echo -en "\e[18;3H Выведет текущий публичный IP-адрес                                 \e[32m -i --ip \e[0m";}
  E7(){ echo -en "\e[20;3H Grannik                                                                \e[36m Git \e[0m";}
  E8(){ echo -en "\e[22;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 git clone https://github.com/ruped24/toriptables2
 cd toriptables2/
 sudo mv toriptables2.py /usr/local/bin/
 cd\e[0m
#\e[32m
 sudo apt install python2
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m toriptables2.py [-h] [-l] [-f] [-r] [-i]\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m toriptables2.py -h\e[0m
#
\e[32m toriptables2.py --help\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo toriptables2.py -l\e[0m
#
\e[32m sudo toriptables2.py --load\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo toriptables2.py -f\e[0m
#
\e[32m sudo toriptables2.py --flush\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo toriptables2.py -r\e[0m
#
\e[32m sudo toriptables2.py --refresh\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo toriptables2.py -i\e[0m
#
\e[32m sudo toriptables2.py --ip\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 7)D;echo -en "\e[47;30m";(E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 mToriptables2 описание утилиты toriptables2
 Скрипт Tor Iptables — это анонимайзер, который настраивает iptables и tor для
 перенаправления всех служб и трафика, включая DNS, через сеть Tor.
 asciinema:  \e[36m https://asciinema.org/a/622828\e[0m
 codeberg:   \e[36m https://codeberg.org/Grannik/mToriptables2\e[0m
 github:     \e[36m \e[0m
 gitlab:     \e[36m \e[0m
 sourceforge:\e[36m \e[0m
 notabug:    \e[36m \e[0m
 bitbucket:  \e[36m \e[0m
 gitea:      \e[36m \e[0m
 gogs:       \e[36m \e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 8)D;echo -en "\e[47;30m";(E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
