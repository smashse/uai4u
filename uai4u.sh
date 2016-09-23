#! /bin/bash
#  *Ubuntu, the distro for human begins
#  Author: uai4u https://github.com/smashse/uai4u
#  License: GPL v3

#adiciona ao sources o release do *ubuntu utilizado
clear
echo "Qual o release do ubuntu utilizado?"
echo -n "Qual a opcao desejada? "
read release
clear

#cria backup do sources.list
echo "#Criando backup do sources.list"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo rm -rf /etc/apt/sources.list.d/*

#adiciona repositorios ao novo sources.list
echo "#Adicionando repositorios ao novo sources.list"
touch "/etc/apt/sources.list"

echo "#ubuntu" >> "/etc/apt/sources.list"
echo "deb http://br.archive.ubuntu.com/ubuntu $release main restricted universe multiverse" >> "/etc/apt/sources.list"
echo "deb http://br.archive.ubuntu.com/ubuntu $release-updates main restricted universe multiverse" >> "/etc/apt/sources.list"
echo "deb http://br.archive.ubuntu.com/ubuntu $release-backports main restricted universe multiverse" >> "/etc/apt/sources.list"
echo "deb http://br.archive.ubuntu.com/ubuntu $release-proposed main restricted universe multiverse" >> "/etc/apt/sources.list"
echo "#security" >> "/etc/apt/sources.list"
echo "deb http://security.ubuntu.com/ubuntu $release-security main restricted universe multiverse" >> "/etc/apt/sources.list"
echo "#partner" >> "/etc/apt/sources.list"
echo "deb http://archive.canonical.com/ubuntu $release partner" >> "/etc/apt/sources.list"

#executando o upgrade
echo "#Executando o upgrade"
sudo apt-get update --fix-missing
sudo apt-get dist-upgrade -y --force-yes
clear

#instala pacotes para audio e video para ubuntu ou kubuntu
gui() {
echo "Utilizando Ubuntu, Kubuntu ou Xubuntu?"
echo "Digite ubuntu, kubuntu ou xubuntu!"
echo -n "Qual a opcao desejada? "
read gui

case $gui in
   ubuntu) ubuntu ;;
   kubuntu) kubuntu ;;
   xubuntu) xubuntu ;;
   *) clear ; echo "Digite [ubuntu] se usa gnome/unitym [kubuntu] se usa kde ou [xubuntu] se usa xfce!" ; sleep 3 ; clear ; gui ;;
esac

}

ubuntu() {
   echo "#Instalando plugins e codecs de audio e video para sua escolha!"
   sudo apt-get install ubuntu-restricted-extras -y --force-yes
}

kubuntu() {
   echo "#Instalando plugins e codecs de audio e video para sua escolha!"
   echo "#ppa-kubuntu" >> "/etc/apt/sources.list"
   echo "deb http://ppa.launchpad.net/kubuntu-ppa/ppa/ubuntu $release main" >> "/etc/apt/sources.list"
   echo "deb http://ppa.launchpad.net/kubuntu-ppa/backports/ubuntu $release main" >> "/etc/apt/sources.list"
   sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8AC93F7A
   sudo apt-get update --fix-missing
   sudo apt-get dist-upgrade -y --force-yes
   sudo apt-get install kubuntu-restricted-extras -y --force-yes
}

xubuntu() {
   echo "#Instalando plugins e codecs de audio e video para sua escolha!"
   sudo apt-get install xubuntu-restricted-extras -y --force-yes
}

gui

clear

#instala suporte a temas
temas() {
echo "Deseja instalar temas?"
echo "Digite sim ou nao!"
echo -n "Qual a opcao desejada? "
read temas

case $temas in
   sim) Sim ;;
   nao) Nao ;;
   *) clear ; echo "Digite [sim] se deseja instalar os temas ou [nao] para finalizar o processo!" ; sleep 3 ; clear ; temas ;;
esac

}

Sim() {
   sudo add-apt-repository ppa:numix/ppa
   sudo add-apt-repository ppa:fossfreedom/budgie-desktop
   sudo add-apt-repository ppa:budgie-remix/ppa
   sudo apt-get update --fix-missing
   sudo apt-get install numix-icon-theme-circle arc-theme -y --force-yes
}

Nao() {
   echo "Temas nao instalados!"
}

temas

clear

#instala suporte ao google-chrome
chrome() {
echo "Deseja suporte ao Google-Chrome?"
echo "Digite sim ou nao!"
echo -n "Qual a opcao desejada? "
read chrome

case $chrome in
   sim) Sim ;;
   nao) Nao ;;
   *) clear ; echo "Digite [sim] se deseja instalar o google-chrome ou [nao] para finalizar o processo!" ; sleep 3 ; clear ; chrome ;;
esac

}

Sim() {
   echo "#google-chrome" >> "/etc/apt/sources.list"
   echo "deb http://dl.google.com/linux/chrome/deb stable main" >> "/etc/apt/sources.list"
   sudo wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
   sudo apt-get update --fix-missing
   sudo apt-get install google-chrome-stable -y --force-yes
}

Nao() {
   echo "Google-Chrome nao instalado!"
}

chrome

clear

echo "Obrigado por utilizar o uai4u!"
sleep 3
clear

exit
