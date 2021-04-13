float spielerX = 420, spielerY = 445;
String benutzerName = "";

void setup() {
  size(800,600);
}

void draw() {
  zeichneSpielfeld();
  if(benutzerName == "") {
    zeichneEingabeName();
  }
  else {
    spielStart();
    fill(200, 0 , 0);
    rect(spielerX, spielerY, 15, 15);
  }  
}

void zeichneSpielfeld() {
  background(0, 150, 0);
  fill(255);
  rect(100, 100, 600, 400);
  fill(251, 153, 51);
  rect(200, 200, 400, 200);
  fill(0);
  rect(width/2-5, 400, 10, 100);
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
      spielerX -= 10;
    }
    else if(keyCode == RIGHT) {
      spielerX += 10;
    }
    
    if(benutzerName == "") {
      //Benutzereingabe
      benutzerEingabe(key);
    }
}

void mouseClicked() {
  //Benutzer-Speichern Button
  if(mouseX > 570 && mouseY < 670 && mouseY > 280 && mouseY < 310) {
    benutzerSpeichern();
  }
  
}
