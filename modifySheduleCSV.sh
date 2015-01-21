#!/bin/sh


if (( $# != 3 )); then
    	echo "Usage: input.csv output.csv "X" where X is the number of your seminar"
  	exit 1
fi

location="\"Escuela Universitaria de Ingeniería Informática, Calle Valdés Salas, Oviedo, Asturias, Spain\""
hoursPerClass=2
seminar=$(echo S.$3)

while IFS=, read subject startDate startTime endDate endTime description class
do
	if [[ $subject == "Subject" ]]; then
		 echo "$subject,$startDate,$startTime,$endDate,$endTime,$description,$class" >> $2
	 else
	if [ -n "$subject" ]; then
		arr=($description)
		classNumber=$(echo "${arr[4]}")
	#	classHour=$(echo "${arr[4]}")
	#	if [[ $subject == *$seminar* ]]; then
	#		classNumber=$(echo $classHour)
	#	else
	#		classNumber=$(echo $(($classHour / $hoursPerClass))) 
	#	fi
		echo "$subject,$startDate,$startTime,$endDate,$endTime, Clase número $classNumber de $subject. Aula:$class,$location" >> $2	
	fi
fi
done < $1
