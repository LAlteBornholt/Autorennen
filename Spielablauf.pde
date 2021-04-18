int runden, rundenZeit, verbleibendeZeit = 20;
int startZeit, stoppZeit;
boolean falscheRichtung = false, neueRunde = false;
float letztePosition;

void spiel() {
  if(spielerX < width/2 - 5 && spielerXletztePosition > width/2 - 5 && spielerY >= 400 && spielerY <= 500 && spielerXletztePosition > spielerX) {
    if(!falscheRichtung) {
      if(stoppuhrStarten) {
        neueRunde = true;
        letztePosition = spielerX;
      }
      else {
        stoppuhrStarten = true;
        startZeit = millis();
      }
    }
  }
  //Spieler im orangenen Feld oder außerhalb des Bildschirms: Spiel zurücksetzen
  if(spielerX > 200 && spielerY > 200 && spielerX < 600 && spielerY < 400 || spielerX < 0 || spielerX > width ||spielerY < 0 || spielerY > height) {    
    spielZuruecksetzen();
  }
  if(stoppuhrStarten) {
    stoppuhrStarten();
    if(verbleibendeZeit <= 0) {
      //Messagebox bei abgelaufener Zeit
      javax.swing.JOptionPane.showMessageDialog(null, "Sie waren zu langsam!");
      spielZuruecksetzen();
    }
    if(spielerX > width/2 - 5 && spielerXletztePosition < width/2 - 5 && spielerY >= 400 && spielerY <= 500 && spielerXletztePosition < spielerX) {
      falscheRichtung = true;
    }
  }
  if(neueRunde && spielerX != letztePosition) {
    runden++;
    falscheRichtung = false;
    neueRunde = false;
    if(runden != 0) { 
      bestenliste = append(bestenliste, benutzerName);
      bestenlisteZeit = append(bestenlisteZeit, rundenZeit);
    }
  }
  zeichneSpielUI();
}

void zeichneSpielUI() {
  fill(0);
  textSize(15);  
  text("Runden: " + runden, 120, 50);
  text("Verbleibende Zeit: " + verbleibendeZeit, 300, 50);
  text("Rundenzeit: " + rundenZeit, 550, 50);
  
  fill(164, 49, 49);
  rect(235, 535, 100, 30, 5);
  rect(485, 535, 100, 30, 5);
  fill(0);
  textSize(15);
  text("Neustart", 255, 555);
  text("Ende", 517, 555);
}

void stoppuhrStarten() {
  stoppZeit = millis();
  
  rundenZeit = (stoppZeit - startZeit) / 100;
  verbleibendeZeit = (200 - rundenZeit) / 10;
}

void spielZuruecksetzen() {
  stoppuhrStarten = false;
    spielerX = spielerAnfangsPositionX;
    spielerY = spielerAnfangsPositionY;
    rundenZeit = 0;
    verbleibendeZeit = 20;
    if(runden > 0) {
      runden--;
    }
}

void zeichneEndeUI() {
  if(bestenliste.length > 1) {
    sortiereArraysAufsteigend();
  }
  fill(255);
  rect(width/2 - 90, 210, 180, 300);
  fill(0);
  textSize(15);
  int textumbruch = 230;
  for(int i = 0; i < bestenliste.length; i++) {
    text(bestenliste[i] + ", " + bestenlisteZeit[i], width/2 - 80, textumbruch); //<>//
    textumbruch += 20;
  }
}

void sortiereArraysAufsteigend() {
  float cache;
  String speicher;
  boolean abbruch = false;
  
  do {
    for(int i = 0; i < bestenlisteZeit.length - 1; i++) {
      if(bestenlisteZeit[i] > bestenlisteZeit[i+1]) {
        abbruch = false;
        cache = bestenlisteZeit[i+1];
        bestenlisteZeit[i+1] = bestenlisteZeit[i];
        bestenlisteZeit[i] = cache;
        
        speicher = bestenliste[i+1];
        bestenliste[i+1] = bestenliste[i];
        bestenliste[i] = speicher;
      }
      else {
        abbruch = true;
      }
    }
  } while(!abbruch);
}
