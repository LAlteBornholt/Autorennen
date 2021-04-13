float spielerX = 350, spielerY = 445;
String[] eingabeNutzername = new String[0];
String eingabe;

void setup() {
  size(800,600);
  zeichneSpielfeld();  
}

void draw() {
  zeichneSpielfeld();
  zeichneEingabeName();
  fill(200, 0 , 0);
  rect(spielerX, spielerY, 15, 15);
}

void zeichneSpielfeld() {
  background(0, 150, 0);
  fill(255);
  rect(100, 100, 600, 400);
  fill(0, 100, 0);
  rect(200, 200, 400, 200);
  fill(0);
  rect(width/2-5, 400, 10, 100);
}

void zeichneEingabeName() {
  fill(0);
  textSize(20);
  text("Bitte Benutzernamen eingeben: ", 50, 300);
  zeichneEingabeTastatur();
}

void zeichneEingabeTastatur() {
  fill(255);
  textSize(20);
  text(eingabe, 400, 300);
}

void keyTyped() {
  if(key != '') {
    eingabeNutzername.append(eingabeNutzername, key);
  }
  else {
    eingabeNutzername[eingabeNutzername.length()-1]
  }
  zeichneEingabeTastatur();
}

void keyPressed() {
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
}
