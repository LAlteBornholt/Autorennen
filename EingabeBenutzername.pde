char[] eingabeNutzername = new char[0];
String eingabe = "";

void zeichneEingabeName() {
  //Hintergrund
  fill(150);
  rect(48, 270, 520, 50);
  
  //Eingabelinie
  stroke(0);
  strokeWeight(3);
  line(360, 310, 560, 310);
  
  //Label Benutzereingabe
  strokeWeight(1);
  fill(0);
  textSize(20);
  text("Bitte Benutzernamen eingeben: ", 50, 300);
  
  //Tastatureingabe
  fill(0);
  textSize(20);
  text(eingabe, 360, 300);
  
  //Speichern Button
  fill(164, 49, 49);
  strokeWeight(3);
  rect(570, 280, 100, 30);
  strokeWeight(1);
  fill(0);
  textSize(15);
  text("Speichern", 585, 300);
}

void benutzerEingabe(char buchstabe) {
    
    if(buchstabe != BACKSPACE && buchstabe != ENTER && buchstabe != SHIFT && buchstabe != ESC && buchstabe != TAB && buchstabe != DELETE) {
      if(eingabeNutzername.length < 12) {
        eingabeNutzername = append(eingabeNutzername, buchstabe);
      }
    }
    else if(buchstabe == BACKSPACE) {
      if(eingabeNutzername.length > 0) {
        eingabeNutzername = shorten(eingabeNutzername);
      }
    }
    eingabe = uebersetzeCharArrayZuString(eingabeNutzername);
    
    if(buchstabe == ENTER) {
        benutzerSpeichern();
        println(benutzerName);
    }
}

void benutzerSpeichern() {
  if(eingabe != "") {
    benutzerName = eingabe;
    zeichneSpielfeld();
  }
  else {
    println("Bitte Benutzernamen eingeben!");
  }
}

String uebersetzeCharArrayZuString(char[] eingabeNutzername) {
  String uebersetzterString = "";
  
  for(int i = 0; i < eingabeNutzername.length; i++) {
    uebersetzterString += eingabeNutzername[i];
  }
  
  return uebersetzterString;
}
