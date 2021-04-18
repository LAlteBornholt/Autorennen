float spielerAnfangsPositionX = 420, spielerAnfangsPositionY = 445;
float spielerX = spielerAnfangsPositionX, spielerY = spielerAnfangsPositionY, spielerXletztePosition;
String benutzerName = "";
boolean stoppuhrStarten = false, spielEnde = false;
String[] bestenliste = new String[0];
float[] bestenlisteZeit = new float[0];

void setup() {
  size(800,600);
}

void draw() {
  zeichneSpielfeld();
  if(benutzerName == "") {
    zeichneEingabeName();
  }
  else {
    if(!spielEnde) {
      spiel();
      fill(200, 0 , 0);
      rect(spielerX, spielerY, 15, 15);
    }
    else {
      zeichneEndeUI();
    }
  }
}

void zeichneSpielfeld() {
  background(0, 150, 0);
  fill(255);
  rect(100, 100, 600, 400);
  fill(251, 153, 51);
  rect(200, 200, 400, 200);
  fill(0);
  rect((width/2)-5, 400, 10, 100);
}

void keyPressed() {
  //Spielersteuerung
  if(keyCode == UP) {
      spielerY -= 10;
  }
  else if(keyCode == DOWN) {
    spielerY += 10;
  }
  else if(keyCode == LEFT) {
    spielerXletztePosition = spielerX;
    spielerX -= 10;
  }
  else if(keyCode == RIGHT) {
    spielerXletztePosition = spielerX;
    spielerX += 10;
  }
  
  if(benutzerName == "") {
    benutzerEingabe(key);
  }
}

void mouseClicked() {
  //Benutzer-Speichern Button
  if(mouseX > 570 && mouseX < 670 && mouseY > 280 && mouseY < 310) {
    benutzerSpeichern();
  }
  //Neustart Button
  else if(mouseX >= 235 && mouseX <= 335 && mouseY >= 535 && mouseY <= 565) {
    //Spieler auf Anfangsposition    
    spielZuruecksetzen();
    benutzerName = "";
    
  }
  //Ende Button
  else if(mouseX >= 485 && mouseX <= 585 && mouseY >= 535 && mouseY <= 565) {
    spielEnde = true;
    //Programm zurücksetzen
    //neue Benutzereingabe
    zeichneSpielfeld();
    zeichneEingabeName();
  }
  
  //Verlassen Button
  if(spielEnde) {
    if(mouseX >= width/2-50 && mouseX <= width/2+50 && mouseY >= 535 && mouseY <= 565) {
      exit();
    }
  }
}
