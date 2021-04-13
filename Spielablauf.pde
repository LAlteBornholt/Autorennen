int runden;
float rundenZeit, verbleibendeZeit;

void spielStart() {
  zeichneUI();
}

void zeichneUI() {
  fill(0);
  textSize(15);  
  text("Runden: " + runden, 120, 50);
  text("Verbleibende Zeit: " + verbleibendeZeit, 300, 50);
  text("Rundenzeit: " + rundenZeit, 550, 50);
}
