#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
  do
    if [[ $YEAR != "year" ]]
    then
      TEAM_W=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
      if [[ -z $TEAM_W ]]
      then
        ADD_W=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      fi
      TEAM_O=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
      if [[ -z $TEAM_O ]]
      then
        ADD_O=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      fi
      W_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      O_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      G_INSERT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$W_ID','$O_ID','$WGOALS','$OGOALS')")
    fi
  done
