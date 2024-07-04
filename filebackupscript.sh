#!/bin/sh
echo ""
echo "Bem vindo ao sistema de backup"
echo ""
echo "Escolha uma opção:"
echo "1: Agendar nova execução de backup"
echo "2: Ver todas as execuções agendadas"
echo "3: Remover todas as execuções"
read opt
echo ""
if [ $opt = "1" ]; then
echo "Vamos especificar a hora que sera feito.Favor informar:"
echo ""
echo "Os minutos, caso não tenha um especifico favor digitar *.(Formato mm 0-59)."
read mm
echo "A hora, caso não tenha um especifico favor digitar *.(Formato hh 0-23)."
read hh
echo "O dia, caso não tenha um especifico favor digitar *.(Formato dd 1-31)."
read dd
echo "O mês, caso não tenha um especifico favor digitar *.(Formato MM 1-12)."
read MM 
echo "O dia da semana, caso não tenha um especifico favor digitar *.(Formato SS 0-6)."
read SS
echo "Digite o caminho da pasta que voce deseja fazer o backup.(EX
/home/usuario/arquivos_importantes)."
read path_folder_origin
if [ -d $path_folder_origin ]; then 
 echo "Existência da pasta confirmada."
 echo "*****************************************";
else 
 echo "Pasta não encontrada.Verifique o caminho e rode o programa novamente."
 echo "*****************************************"
 exit;
fi
echo ""
echo "Digite o caminho da pasta onde voce deseja que os arquivos sejam salvos. Ela não
precisa existir previamente (EX /home/usuario/arquivos_importantes)."
read path_folder_destiny
if [ -d $path_folder_destiny ]; then 
 echo "Pasta já existe. Não será criada uma nova"
 echo "*****************************************";
else 
 echo "Pasta não encontrada.Ela sera criada."
 mkdir $path_folder_destiny
 echo "*****************************************";
fi
echo "rsync -arv "$path_folder_origin $path_folder_destiny > script_backup.sh
chmod 777 script_backup.sh
dir=$(pwd)/script_backup.sh
echo $dir
#echo echo "$mm $hh $dd $MM $SS $dir" > teste.sh
(crontab -l 2>/dev/null; echo "$mm $hh $dd $MM $SS $dir" ) | crontab -
echo "Backup agendado com sucesso"
elif [ $opt = "2" ]; then
crontab -e 
exit
elif [ $opt = "3" ]; then
crontab -r 
echo "Todas as execuções foram removidas"
exit 
else
 echo
 echo "Entre com um parametro valido"
fi
echo
