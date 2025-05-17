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

${DISCO}5	/Examenes-UTN/alumno_1/parcial_1	ext4	defaults	    0   0
${DISCO}6	/Examenes-UTN/alumno_1/parcial_2	ext4    defaults        0   0
${DISCO}7	/Examenes-UTN/alumno_1/parcial_3	ext4    defaults        0   0
${DISCO}8	/Examenes-UTN/alumno_2/parcial_1	ext4    defaults        0   0
${DISCO}9	/Examenes-UTN/alumno_2/parcial_2	ext4    defaults        0   0
${DISCO}10	/Examenes-UTN/alumno_2/parcial_3	ext4    defaults        0   0
${DISCO}11	/Examenes-UTN/alumno_3/parcial_1	ext4    defaults        0   0
${DISCO}12	/Examenes-UTN/alumno_3/parcial_2	ext4    defaults        0   0
${DISCO}13	/Examenes-UTN/alumno_3/parcial_3	ext4    defaults        0   0
${DISCO}14	/Examenes-UTN/profesores		    ext4    defaults	    0	0

EOF

echo "monto todo"
sudo mount -a

echo "muestro lo que esta montado"
echo 
sudo df -h  | grep -E 'Filesystem|Examenes-UTN'

