#!/bin/bash

#Creo grupos
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

#Obtengo HASH
HASH=$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}')

#Creo usuarios alumnos
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gAlumno p1_c2_2024_A1
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gAlumno p1_c2_2024_A2
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gAlumno p1_c2_2024_A3

#Creo usuarios profesores
sudo useradd -m -s /bin/bash -p "${HASH}" -G p1c2_2024_gProfesores p1_c2_2024_P1

#Seteo owner
sudo chown -R p1c2_2024_gAlumno p1_c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_gAlumno p1_c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_gAlumno p1_c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown -R p1c2_2024_P1.p1c2_2024_gProfesores /Examenes-UTN/profesores

#Seteo permisos 
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores

echo "Muestro permisos y owner de carpeteas: "
echo 
sudo ls -l /Examenes-UTN
echo

#Creo el archivo validar.txt
sudo su -c "whoami > /Examenes-UTN/alumno_1/Validar.txt" p1_c2_2024_A1
sudo su -c "whoami > /Examenes-UTN/alumno_2/Validar.txt" p1_c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/Validar.txt" p1_c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/Validar.txt" p1_c2_2024_P1

echo 
echo "Muestro los nombres de los usuarios cargados en los archivos: "
echo
sudo grep -R p1c2 /Examenes-UTN
