#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "Welcome to My Salon, how can I help you?"
  GET_SERVICES=$($PSQL "SELECT * FROM services")
  echo "$GET_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  #echo "Please select a service by inputting the corresponding number. If you do not want any of the services, input 8 to exit."
  read SERVICE_ID_SELECTED
  MAIN_MENU_SELECTION=$SERVICE_ID_SELECTED
  case $MAIN_MENU_SELECTION in
    1) SERVICE_MENU $MAIN_MENU_SELECTION ;;
    2) SERVICE_MENU $MAIN_MENU_SELECTION ;;
    3) SERVICE_MENU $MAIN_MENU_SELECTION ;;
    4) SERVICE_MENU $MAIN_MENU_SELECTION ;;
    5) SERVICE_MENU $MAIN_MENU_SELECTION ;;
    6) SERVICE_MENU $MAIN_MENU_SELECTION ;;
    7) SERVICE_MENU $MAIN_MENU_SELECTION ;;
    #8) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

SERVICE_MENU() {
  SERVICE_ID_SELECTED=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CHECK_PHONE_NUMBER=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CHECK_PHONE_NUMBER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    echo -e "\nWhat time would you like your$SERVICE, $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id,time,customer_id) VALUES($SERVICE_ID_SELECTED,'$SERVICE_TIME',$CUSTOMER_ID)")
    echo -e "\nI have put you down for a$SERVICE at $SERVICE_TIME, $CUSTOMER_NAME." 
  else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    echo -e "\nWhat time would you like your$SERVICE,$CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id,time,customer_id) VALUES($SERVICE_ID_SELECTED,'$SERVICE_TIME',$CUSTOMER_ID)")
    echo -e "\nI have put you down for a$SERVICE at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
  
}

EXIT() {
  echo -e "\nThank you for visiting us.\n"
}

MAIN_MENU
