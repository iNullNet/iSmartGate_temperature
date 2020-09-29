#!/bin/bash

### VARIABILI ###
URL_GARAGE="URL ISMARGATE"
USERNAME="USERNAME"
PASWD="PASSWORD"
COMMAND="login=$USERNAME&pass=$PASWD&send-login=Accedi"
#curl 'URL ISMARTGATE' --data-raw 'login=USERNAME&pass=PASSWORD&send-login=Accedi'  --compressed --insecure -s |grep "tempspan_C"
DIRECTORY_SAVE_INFO="/home/pi/.temperatura_garage"

function temperatura_garage_check() {
	TEMPERATURA=$(curl -s "$URL_GARAGE" --data-raw ' '"$COMMAND"' '  --compressed --insecure |grep "tempspan_C")
	TEMPERATURA=$(echo "$TEMPERATURA" |grep -oP '(?<=temperature-text">)(.*?)(?=</div>)' )
	echo "$TEMPERATURA" >"$DIRECTORY_SAVE_INFO"
}


### MAIN ###
temperatura_garage_check