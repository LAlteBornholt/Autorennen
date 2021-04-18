float spielerAnfangsPositionX = 420, spielerAnfangsPositionY = 445; //festgelegte Startposition des Spielers festgehalten in Variablen
float spielerX = spielerAnfangsPositionX, spielerY = spielerAnfangsPositionY, spielerXletztePosition;//Definieren der Startposition, Deklaration letzteStartposition X-Achse
String benutzerName = ""; //Deklaration und Definition Benutzername
boolean stoppuhrStarten = false, spielEnde = false; //Hilfsvariablen zum Starten der Stoppuhr und zum Verlassen des Spiels
String[] bestenliste = new String[0];//Deklaration bestenliste als String für die Namen
float[] bestenlisteZeit = new float[0];// Deklaration der bestenliste als float für die Zeiten

void setup() {
  size(800,600);//Bildschirmgröße
}

void draw() {
  zeichneSpielfeld();//Funktionsaufruf zum Zeichnen des Spielfeldes
  if(benutzerName == "") {//Ist eine Benutzereingabe schon getätigt worden?
    zeichneEingabeName();//Funktionsaufruf um die Benutzereingabe zu zeichnen
  }
  else {
    if(!spielEnde) { //Wurde auf den Verlassen Button geklickt?
      spiel(); //Funktionsaufruf um den Spielverlauf auszuführen
      fill(200, 0 , 0); //Spieler rot färben
      rect(spielerX, spielerY, 15, 15);//Spieler zeichnen
    }
    else {
      zeichneEndeUI();//Verlassen Button wurde gedrückt: Zeichnen der Bestenliste
    }
  }
}

void zeichneSpielfeld() {
  background(0, 150, 0); //Hintergrund des Spielfeldes grün
  fill(255); //weiße "Rennbahn"
  rect(100, 100, 600, 400); //Rennbahn zeichen
  fill(251, 153, 51);//orangene Innenfläche der Rennbahn
  rect(200, 200, 400, 200);//Innenfläche der Rennbahn zeichnen
  fill(0);//schwarze Start/Ziellinie
  rect((width/2)-5, 400, 10, 100);//Zeichnen der Ziellinie
}

void keyPressed() {
  //Spielersteuerung
  if(keyCode == UP) {//Pfeiltaste oben gedrückt?
      spielerY -= 10;//Spieler um 10 Pixel nach oben bewegen
  }
  else if(keyCode == DOWN) {//Pfeiltaste unten gedrückt?
    spielerY += 10;//Spieler um 10 Pixel nach unten bewegen
  }
  else if(keyCode == LEFT) {//Pfeiltaste links gedrückt?
    spielerXletztePosition = spielerX;//letzte Position des Spieler speichern zur Abfrage ob die Linie von der richtigen Seite überquert wurde
    spielerX -= 10;//Spieler um 10 Pixel nach links bewegen
  }
  else if(keyCode == RIGHT) {//Pfeiltase rechts gedrückt?
    spielerXletztePosition = spielerX;//letzte Position des Spieler speichern zur Abfrage ob die Linie von der richtigen Seite überquert wurde
    spielerX += 10;//Spieler um 10 Pixel nach rechts bewegen
  }
  
  if(benutzerName == "") {//Ist der Benutzername noch nicht eingegeben?
    benutzerEingabe(key);//Funktionsaufruf Benutzereingabe: Übergabe der aktuell gedrückten Taste
  }
}

void mouseClicked() {
  //Benutzer-Speichern Button
  if(mouseX >= 570 && mouseX <= 670 && mouseY >= 280 && mouseY <= 310) {//Liegt der Mauszeiger beim Klick im Bereich des Speichern-Buttons?
    benutzerSpeichern();//Funktionsaufruf Benutzer speichern
  }
  //Neustart Button
  else if(mouseX >= 235 && mouseX <= 335 && mouseY >= 535 && mouseY <= 565) {//Liegt der Mauszeiger beim Klick im Bereich des Neustart-Buttons?      
    spielZuruecksetzen();//Funktionsaufruf zum Zurücksetzen des Spiels
    benutzerName = "";//Benutzername Variable leeren    
  }
  //Ende Button
  else if(mouseX >= 485 && mouseX <= 585 && mouseY >= 535 && mouseY <= 565) {//iegt der Mauszeiger beim Klick im Bereich des Ende-Buttons?     
    spielEnde = true;//Hilfsvariable leitet den Aufruf der Verlassen-Maske ein
    zeichneSpielfeld();//Spielfeld erneut malen, um die Runden und Zeiten sowie die Buttons auszublenden
  }
  
  //Verlassen Button
  if(spielEnde) {//wurde der Ende Button gedrückt?
    if(mouseX >= width/2-50 && mouseX <= width/2+50 && mouseY >= 535 && mouseY <= 565) {//iegt der Mauszeiger beim Klick im Bereich des Verlassen-Buttons?   
      exit();//Programm verlassen
    }
  }
}
