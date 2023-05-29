#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
TARGET_NUMBER=$((1 + RANDOM % 1000))

echo "Enter your username:"
read -n 22 USERNAME
ID_CHECK=$($PSQL "SELECT user_id FROM user_info WHERE username='$USERNAME'")
if [[ -z $ID_CHECK ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=1000
  INSERT=$($PSQL "INSERT INTO user_info (username,games_played,best_game) VALUES('$USERNAME','$GAMES_PLAYED','$BEST_GAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_info WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo -e "\nGuess the secret number between 1 and 1000:"

GUESS_COUNT=0
GUESS_NUMBER=0
while [[ $GUESS_NUMBER -ne $TARGET_NUMBER ]] 
do
  read GUESS_NUMBER
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
  elif [[ $GUESS_NUMBER -lt $TARGET_NUMBER ]]
  then
    ((GUESS_COUNT++))
    echo -e "\nIt's higher than that, guess again:"
  elif [[ $GUESS_NUMBER -gt $TARGET_NUMBER ]]
  then
    ((GUESS_COUNT++))
    echo -e "\nIt's lower than that, guess again:"
  else
    ((GUESS_COUNT++))
    echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $TARGET_NUMBER. Nice job!"
    ((GAMES_PLAYED++))
    if [[ $GUESS_COUNT -lt $BEST_GAME ]]
    then
      BEST_GAME=$GUESS_COUNT
    fi
    UPDATE=$($PSQL "UPDATE user_info SET games_played='$GAMES_PLAYED', best_game='$BEST_GAME' WHERE username='$USERNAME'")
  fi
done
  
  
