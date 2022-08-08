#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  # Verify if input is a number. two cases, if its a number or not.
  if [[ $1 =~ ^[0-9]+*$ ]]
  then
  TEST_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number= $1;")
    # If number not in DB
    if [[ -z $TEST_ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      #Final response here.
       echo -e "The element with atomic number $(echo $TEST_ATOMIC_NUMBER | sed -r 's/^ *| *$//g') is $(echo $NAME | sed -r 's/^ *| *$//g') $( echo "($SYMBOL)" | sed -r 's/ //g'). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $(echo $MASS | sed -r 's/^ *| *$//g') amu. $(echo $NAME | sed -r 's/^ *| *$//g') has a melting point of $(echo $MELTING | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $BOILING | sed -r 's/^ *| *$//g') celsius."
    fi

  else
    # If is not a number, verify if input is a valid name or symbol.
    TEST_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name= '$1' OR symbol = '$1';")
    if [[ -z $TEST_ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number= $TEST_ATOMIC_NUMBER;")
      #Final response here.
       echo -e "The element with atomic number $(echo $TEST_ATOMIC_NUMBER | sed -r 's/^ *| *$//g') is $(echo $NAME | sed -r 's/^ *| *$//g') $( echo "($SYMBOL)" | sed -r 's/ //g'). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $(echo $MASS | sed -r 's/^ *| *$//g') amu. $(echo $NAME | sed -r 's/^ *| *$//g') has a melting point of $(echo $MELTING | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $BOILING | sed -r 's/^ *| *$//g') celsius."
    fi
  fi
fi




