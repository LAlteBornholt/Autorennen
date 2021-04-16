int runden;
float rundenZeit, verbleibendeZeit;

void spielStart() {
  //Zeit wird nur gestoppt wenn Spieler von rechts nach links über die Linie läuft
  if(spielerX < width/2 - 5 && spielerXletztePosition > width/2 -5 && spielerY >= 400 && spielerY <= 500 && spielerXletztePosition > spielerX) {
    //Stoppuhr start
    println("Start");
  }
  
  
  
  zeichneUI();
}

void zeichneUI() {
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
