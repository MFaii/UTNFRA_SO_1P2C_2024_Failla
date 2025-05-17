#!/bin/bash
DISCO = $(sudo fdisk -l | grep "10 G" | awk '{print $2}' | awk -F ':' '{print $1}')

#Crear particiones
sudo fdisk $DISCO << EOF 
n
e
1

n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF

sudo partprobe $DISCO

#Muestro particiones
sudo fdisk -l $DISCO

read -p "Enter para continuar"

#Formateo

sudo fdisk $DISCO -l | grep Linux | awk '{print $1}' | xargs - I PARTICION sudo mkfs.ext4 PARTICION

read -p "Enter para continuar: "
echo "Add Montaje Persistente: "
echo

cat << EOF | sudo tee -a /etc/fstab

EOF

echo "monto todo"
sudo mount -a

echo "muestro lo que esta montado"
echo 
sudo df -h  | grep -E 'Filesystem|Examenes-UTN'

