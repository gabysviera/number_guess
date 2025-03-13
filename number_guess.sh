#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#---------------#1. Ask username-----------------
echo Enter your username:
read INPUT

#--------------#3. Game --------------
GUESS_GAME () {
NUMBER=$(( RANDOM % 1000 + 1 ))

USER_GUESS=0
TRIES=0
echo Guess the secret number between 1 and 1000:

while (( $USER_GUESS != $NUMBER ))
do
read USER_GUESS
#check if the input is an integer
if [[ $USER_GUESS =~ ^-?[0-9]+$ ]]
then
#check if the number is between 1 and 1000
if (( $USER_GUESS > 1000 || $USER_GUESS < 1 ))
then
echo Please, guess a number between 1 and 1000
else
if [[ $USER_GUESS > $NUMBER ]]
then 
echo "It's lower than that, guess again:"
elif [[ $USER_GUESS < $NUMBER ]]
then
echo "It's higher than that, guess again:"
else
(( TRIES++ ))
echo You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!
#adding number_attempts to the database
ADD_NUMBER_ATTEMPTS=$($PSQL "UPDATE games SET number_attempts_to_win = $TRIES WHERE user_id = '$GET_USER_ID'")
fi
fi
else
echo That is not an integer, guess again:
USER_GUESS=0
fi
(( TRIES++ ))
done

}

#---------------#2. Data user -----------------
#check if the username is in the db or we need to add in:
GET_USER=$($PSQL "SELECT name FROM users WHERE name = '$INPUT'")
  if [[ -z $GET_USER ]]
  then
  echo Welcome, $INPUT! It looks like this is your first time here.
  #registering user and getting user_id
  ADD_USER=$($PSQL "INSERT INTO users(name) VALUES('$INPUT')")
  GET_USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$INPUT'")
  GAMES_PLAYED=0
  (( GAMES_PLAYED++ ))
  #add to the database
  ADD_GAMES_PLAYED=$($PSQL "INSERT INTO games(user_id, games_played) VALUES('$GET_USER_ID', '$GAMES_PLAYED')")
  GUESS_GAME 

  else #if [[ -z $GET_USER ]]
  #get user data
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM games INNER JOIN users USING(user_id) WHERE name = '$INPUT'")
  NUMBER_ATTEMPTS_TO_WIN=$($PSQL "SELECT number_attempts_to_win FROM games INNER JOIN users USING(user_id) WHERE name = '$INPUT'")
  echo Welcome back, $INPUT! You have played $GAMES_PLAYED games, and your best game took $NUMBER_ATTEMPTS_TO_WIN guesses.
  (( GAMES_PLAYED++ ))

#add to the database
  #get user_id
  GET_USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$INPUT'")
  ADD_GAMES_PLAYED=$($PSQL "INSERT INTO games(user_id, games_played) VALUES('$GET_USER_ID', '$GAMES_PLAYED')")
  GUESS_GAME
fi

#This code was created by Gabriela Viera
