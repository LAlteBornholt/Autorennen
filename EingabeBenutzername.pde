char[] eingabeNutzername = new char[0];//Deklaration Char-Array zur Benutzereingabe
String eingabe = "";//Deklaration eingabe

void zeichneEingabeName() {//Eingabemaske zur Eingabe des Benutzernamens zeichnen
  //Hintergrund
  fill(150);//grauer Hintergrund des Rechtecks
  rect(48, 270, 520, 50);//zeichnen des grauen Rechtecks
  
  //Eingabelinie
  stroke(0);//Unterstrich zur Orientierung der Eingabe
  strokeWeight(3);//Dicke der Linie
  line(360, 310, 560, 310);//Zeichnen der Linie
  
  //Label Benutzereingabe
  strokeWeight(1);//Zurücksetzen der Schriftdicke
  fill(0);//schwarze Schrift
  textSize(20);//Schriftgröße 20
  text("Bitte Benutzernamen eingeben: ", 50, 300);//Aufforderungstext innerhalb des Hintergrundrechtecks
  
  //Tastatureingabe
  fill(0);//schwarze Schrift
  textSize(20);//Schriftgröße 20
  text(eingabe, 360, 300);//Zeichnen der Texteingabe (aktualisiert und ändert sich pro Tastatureingabe)
  
  //Speichern Button
  fill(164, 49, 49);//roter Button
  rect(570, 280, 100, 30, 5);//Zeichnen des Buttons
  fill(0);//schwarze Schrift
  textSize(15);//Schriftgröße 15
  text("Speichern", 585, 300);//Beschriftung des Buttons
}

void benutzerEingabe(char buchstabe) {//Funktion zur Benutzereingabe
    
    if(buchstabe != BACKSPACE && buchstabe != ENTER && buchstabe != SHIFT && buchstabe != ESC && buchstabe != TAB && buchstabe != DELETE) {//Eingabetasten, die nicht zur Eingabe gehören sollen
      if(eingabeNutzername.length < 12) {//maximale Buchstabenanzahl von 12
        eingabeNutzername = append(eingabeNutzername, buchstabe);//Hinzufügen des eingegebenen Buchstabens zum Char-Array
      }
    }
    else if(buchstabe == BACKSPACE) {//Abfrage zur Löschung von Buchstaben
      if(eingabeNutzername.length > 0) {//Verhinderung eines Fehlers: Arraygröße kleiner als 0
        eingabeNutzername = shorten(eingabeNutzername);//Arraygröße um 1 reduzieren
      }
    }
    eingabe = uebersetzeCharArrayZuString(eingabeNutzername);//Funktionsaufruf zur Umwandlung des Char-Arrays in einen String
    
    if(buchstabe == ENTER) {//Alternativ zum klicken des Speichern Buttons lässt sich die Speicherung durch Betätigung der ENTER Taste durchführen
        benutzerSpeichern();//Funktionsaufruf zur Speicherung des Benutzers
    }
}

void benutzerSpeichern() {
  if(eingabe != "") {//Wurde eine Eingabe getätigt?
    benutzerName = eingabe;//eingabe in zwischenvariable speichern
    eingabe = "";//eingabe Variable leeren
    while(eingabeNutzername.length > 0) {//charr array inhalt löschen
      eingabeNutzername = shorten(eingabeNutzername);
    }
    zeichneSpielfeld();//FUnktionsaufruf, der das Spielfeld anzeigt und die benutzereingabe verschwinden lässt
  }
  else {
    println("Bitte Benutzernamen eingeben!");//Konsolenausgabe, dass kein Benutzername eingegeben wurde
  }
}

String uebersetzeCharArrayZuString(char[] eingabeNutzername) {//Umwandlung des char arrays zu einem string
  String uebersetzterString = "";//definition string
  
  for(int i = 0; i < eingabeNutzername.length; i++) {//pro charr array wird der jeweilige inhalt an einen String angefügt
    uebersetzterString += eingabeNutzername[i];
  }
  
  return uebersetzterString;//Rückgabewert der funktion ist der fertige string, der nun in der Benutzereingabe als eingegebenen Benutzernamen angezeigt wird
}
