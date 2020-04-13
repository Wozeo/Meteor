
boolean capture = true;

void setup() {
  size(1920, 1080);
  meteor();
}

int nMeteorMin = 7;
int nMeteorMax = 12;
int diamMeteor[] = {5, 12};
int couleurFinalLimite = 120;

void meteor() {
  int l = 45;
  int seuil = 35;
  float b = random(0, l);
  float angle = random(PI/4.0-0.09, PI/4.0+0.09);
  int nbMeteor = int(random(nMeteorMin, nMeteorMax));

  while (b > seuil) {
    l --;
    b = random(0, l);
  }
  color backcolor = color(random(0, 10), random(0, 10), b);
  background(backcolor);

  for (int i = 0; i < nbMeteor; i ++) {

    float x = random(width*0.06, width*0.85);
    float y = random(height*0.35, height*0.96);

    float tpass = sqrt(x*x+y*y);
    float taille = random(tpass/2.5, tpass/1.25);
    gradient(x-cos(angle)*taille, y-sin(angle)*taille, x, y, random(diamMeteor[0], diamMeteor[1]), backcolor, color(random(couleurFinalLimite, 255), random(couleurFinalLimite, 255), random(couleurFinalLimite, 255)));
  }
  if (capture) {
    saveFrame("Meteor-#####.png");
  }
}

boolean in(float x, float y) {
  boolean a = true;
  if (x < 0 || x > width || y < 0 || y > height) {
    a = false;
  }
  return a;
}


void gradient(float x, float y, float xf, float yf, float diam, color base, color fin) {
  float taille = sqrt((x-xf)*(x-xf)+(y-yf)*(y-yf));
  int n = int(taille)+1;
  float tx = (xf-x)/(n-1);
  float ty = (yf-y)/(n-1);

  for (int i = 0; i < n; i ++) {
    noStroke();
    color c = lerpColor(base, fin, float(i)/n);

    fill(c);
    ellipse((x+i*tx), (y+i*ty), (diam), (diam));
  }
}

void draw() {
}

void mousePressed() {
  meteor();
}
