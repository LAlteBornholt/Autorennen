int runden, rundenZeit, verbleibendeZeit = 20;//deklaration der User Interface Variablen
int startZeit, stoppZeit;//Variablen zur Erfassung der Zeit
boolean falscheRichtung = false, neueRunde = false;//Hilfsvariablen zur Überschreitung des Spielers der Startlinie in falscher Richtung und zur Feststellung, ob eine neue Runde gestartet wurde
float letztePositionX;/*Hilfsvariable zur Abfrage der letzten Position des Spielers auf der X-Achse, 
                      Unterschied zur Variable "spielerXletztePosition" ist, dass ein Unterschied bestehen muss und die letzte Position des Spielers nicht als Historie dienen soll*/

void spiel() {//Funktion zum eigentlichen Ablauf des Autorennens
  if(spielerX < width/2 - 5 && spielerXletztePosition > width/2 - 5 && spielerY >= 400 && spielerY <= 500 && spielerXletztePosition > spielerX) {//Ist der Spieler von rechts nach links über die Startlinie gegangen?
    if(!falscheRichtung) {//ist der Spieler zuvor von links nach rechts über die Startlinie?
      if(stoppuhrStarten) {//Ist eine Runde bereits angefangen?
        neueRunde = true;//Hilfsvariable um den Rundencounter hochzuzählen //<>//
        letztePositionX = spielerX;//letzte Position des Spielers zwischenspeichern, um ein einzelnes Hochzählen der Rundenzahl zu erreichen
      }
      else {
        stoppuhrStarten = true;//Stoppuhr starten, da es sich um die erste Runde handelt
      }
    }
  }  
  if(spielerX > 200 && spielerY > 200 && spielerX < 600 && spielerY < 400 || spielerX < 0 || spielerX > width ||spielerY < 0 || spielerY > height) {//Ist der Spieler im orangenen Feld oder außerhalb des Bildschirms?   
    spielZuruecksetzen();//Spieler und Zeit zurücksetzen 
  }
  if(stoppuhrStarten) {//soll die Stoppuhr gestartet werden?
    stoppuhrStarten();//Funktionsaufruf: Stoppuhr starten
    if(verbleibendeZeit <= 0) {//Ist die Zeit abgelaufen?      
      javax.swing.JOptionPane.showMessageDialog(null, "Sie waren zu langsam!");//Messagebox bei abgelaufener Zeit
      spielZuruecksetzen();//Spieler und Zeit zurücksetzen
    }
    if(spielerX > width/2 - 5 && spielerXletztePosition < width/2 - 5 && spielerY >= 400 && spielerY <= 500 && spielerXletztePosition < spielerX) {//Ist der Spieler von links nach rechts über die Startlinie gelaufen?
      falscheRichtung = true;//Hilfsvariable zur feststellung der Laufrichtung: Spieler ist in die falsche Richtung über die Startlinie
    }
  }
  if(neueRunde && letztePositionX != spielerX) {//soll eine neue Runde gestartet werden UND bleibt der Spieler nicht an der gleichen Stelle stehen (Verhinderung des unendlichen Hochzählens der Rundenzahl)
    runden++;//Hochzählen der Runde //<>//
    falscheRichtung = false;//Hilfsvariable zurücksetzen
    neueRunde = false;//Hilfsvariable zurücksetzen
    startZeit = millis();//Referenzzeit für die Stoppuhr setzen
    if(runden != 0) { //hat der Spieler eine Runde abgeschlossen?
      bestenliste = append(bestenliste, benutzerName);//benutzernamen in String Array für die Bestenliste abspeichern
      bestenlisteZeit = append(bestenlisteZeit, rundenZeit);//Zeit für die bestenliste im float Array mit gleichem Index zum Benutzernamen abspeichern
    }
  }
  zeichneSpielUI();//Anzeige der Rundenzahl, verbleibenden Zeit, aktuelle Rundenzeit und beiden Buttons Neustart und Ende
}

void zeichneSpielUI() {
  fill(0);
  textSize(15);  
  text("Runden: " + runden, 120, 50);//aktuelle Rundenzahl
  text("Verbleibende Zeit: " + verbleibendeZeit, 300, 50);//verbleibende Zeit in Sekunden
  text("Rundenzeit: " + rundenZeit, 550, 50);//aktuelle Rundenzeit in Zehntelsekunden
  
  fill(164, 49, 49);//einheitliche Button Farbe: rot
  rect(235, 535, 100, 30, 5);//Neustart Button
  rect(485, 535, 100, 30, 5);//Ende Button
  fill(0);
  textSize(15);
  text("Neustart", 255, 555);
  text("Ende", 517, 555);
}

void stoppuhrStarten() {
  stoppZeit = millis();//Vergleichszeit für die Stoppuhr: millis zählt die millisekunden, seitdem das Programm gestartet ist
  
  rundenZeit = (stoppZeit - startZeit) / 100;//Differenz zwischen der stoppzeit und der startzeit in Zehntelsekunden
  verbleibendeZeit = (200 - rundenZeit) / 10;//Differenz der maximal verfügbaren Zeit und der aktuellen Rundenzeit in Sekunden
}

void spielZuruecksetzen() {//Funktion zur ZUrücksetzung des Spiels
  stoppuhrStarten = false;
  spielerX = spielerAnfangsPositionX;
  spielerY = spielerAnfangsPositionY;
  rundenZeit = 0;
  verbleibendeZeit = 20;
  if(runden > 0) {//Angefangene Runden werden zurückgesetzt, außer es ist die erste Runde
    runden--;
  }
}

void zeichneEndeUI() {//Zeichnen der Maske, wenn auf den Ende-Button geklickt wurde
  if(bestenliste.length > 1) {//mindestens 2 Einträge sollten sich in der bestenliste befinden
    sortiereArraysAufsteigend();//Sortierung bei mindestens 2 Einträgen
  }
  fill(255);
  rect(width/2 - 90, 210, 180, 300);//Hintergrund für die Bestenliste
  fill(0);
  textSize(15);
  int textumbruch = 230;//Y-Koordinate zur Definition des Zeilenbeginns der Bestenliste
  for(int i = 0; i < bestenliste.length; i++) {//Zählen bis zur Länge der Bestenliste
    text(bestenliste[i] + ", " + bestenlisteZeit[i], width/2 - 80, textumbruch);//Anzeige des Benutzernamens mit der Zeit //<>//
    textumbruch += 20;//passender Abstand zwischen den Zeilen
    if(i == 10) {//maximal 10 Einträge in der Liste
      break;
    }
  }
  fill(164, 49, 49);
  rect(width/2 - 50, 535, 100, 30, 5);//Verlassen Button
  fill(0);
  textSize(15);
  text("Verlassen", width/2 - 40, 555);//Beschriftung Button
}

void sortiereArraysAufsteigend() {//Bubble Sort Funktion zur Sortierung von zwei Arrays mit parallelen Indizes
  float cache;
  String speicher;
  boolean abbruch = false;
  
  do {
    for(int i = 0; i < bestenlisteZeit.length - 1; i++) {
      if(bestenlisteZeit[i] > bestenlisteZeit[i+1]) {//Aufsteigende Sortierung der Einträge
        abbruch = false;
        cache = bestenlisteZeit[i+1];//Dreieckstausch der bestenlisteZeit
        bestenlisteZeit[i+1] = bestenlisteZeit[i];
        bestenlisteZeit[i] = cache;
        
        speicher = bestenliste[i+1];//Dreieckstausch der bestenliste
        bestenliste[i+1] = bestenliste[i];
        bestenliste[i] = speicher;
      }
      else {
        abbruch = true;
      }
    }
  } while(!abbruch);//Abbruch nur bei vollständiger Sortierung
}
