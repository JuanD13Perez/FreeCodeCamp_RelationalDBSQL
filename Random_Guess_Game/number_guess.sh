#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=random_guess -t --no-align -c"

echo -e "\n~~~~ Welcome to Random Number guess~~~~"
echo -e "\nEnter your username:"
read USERNAME_INPUT

CHARACTERS=$(printf "$USERNAME_INPUT" | wc -m)

if [[ $CHARACTERS -gt 22 ]]
then
  # Verify if user input contains correct number of characters.
  echo Sorry the maximun number of characters is 22. Try another username.
else 
   USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME_INPUT';")
   if [[ -z $USER_ID ]]
   then
    echo -e "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME_INPUT');")
   else
    COUNT=$($PSQL "SELECT MIN(count) FROM games WHERE user_id = $USER_ID;")
    NUMBER_GAMES=$($PSQL "SELECT COUNT(count) FROM games WHERE user_id = $USER_ID;")
    echo -e "Welcome back, $(echo $USERNAME_INPUT | sed -E 's/^ *| *$//g')! You have played $(echo $NUMBER_GAMES | sed -E 's/^ *| *$//g') games, and your best game took $(echo $COUNT | sed -E 's/^ *| *$//g') guesses."
   fi
fi

RANDOM_NUMBER=$(( ($RANDOM % 1000) + 1))
echo -e "\nGuess the secret number between 1 and 1000:"
COUNTER=1
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME_INPUT';")
MAIN_GUESS(){

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
read USER_GUESS

if [[  $((USER_GUESS)) == $USER_GUESS ]]
then
 if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
 then
  COUNTER=$((COUNTER+1))
  MAIN_GUESS "It's lower than that, guess again:"
 elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
 then
  COUNTER=$((COUNTER+1))
  MAIN_GUESS "It's higher than that, guess again:"
 else
  INSERT_GAME=$($PSQL "INSERT INTO games(count, user_id) VALUES($COUNTER , $USER_ID);")
  echo "You guessed it in $(echo $COUNTER | sed -E 's/^ *| *$//g') tries. The secret number was $RANDOM_NUMBER. Nice job!"
 fi
else
  MAIN_GUESS "That is not an integer, guess again:"
fi
}
MAIN_GUESS
