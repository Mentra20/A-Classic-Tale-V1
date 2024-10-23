int persoX=375; int persoY=750;  float frame; int pause=1; int difficulte=0; PImage Difficulte;
int collG=0; int collD=0; int collH=0; int collB=0;
PImage perso; PImage bulle; PImage Mort; PImage vide; PImage carotte; PImage carotte2; PImage gentleman; PImage clef; PImage clef2;
int gentleX=675; int gentleY=375-18; PImage caisse; int caisseX=525; int caisseY=450;
int mechantX=225; int mechantY=225;
int mechant2X; int mechant2Y;
int mechant3Y; int mechant3X;
int mechant4Y; int mechant4X;
int mechant5Y; int mechant5X;
PImage mechant; PImage mechant2; PImage mechant3; PImage mechant4; PImage mechant5;
int sortie=0;
int para=0;
int terrain =1;
int m=1;
int mort=0;
int marche=1; int marcheA1=0; int marcheA2=0; int marcheA3=0; int marcheA4=0;
int Gentleman=0;
int posobjclef=0;
int objclef=1;
int tempsC=0; int TRY=0;
int objclef2=0; int cabane=0; int CCa=0;
int tempsG=0; int coeur=3; PImage Coeur; int game =1; PImage gameover; int GO; int GO2=1;
int objcarotte=0; int dark=0; int tempsCa=0;
 PImage terrain4; PImage Pause; int restart=0; int text=0; int condtext=0;
int yetiX=450; int yetiY=150; PImage yeti; int dir;
int collyetiH=0; int collyetiB=0; int collyetiD=0; int collyetiG=0; int vu;
import ddf.minim.*;  AudioPlayer song; Minim minim; int SONG=0; AudioPlayer song2;AudioPlayer song3;AudioPlayer song4;   
AudioPlayer song5; AudioPlayer song6; AudioPlayer song7; AudioPlayer song8; AudioPlayer song9;
IntList listeX=new IntList(); IntList listeY=new IntList();  PImage FIN;
 
 
void setup(){
size(900,900);  minim = new Minim(this); 
song=minim.loadFile("Undertale OST- 003 - Your Best Friend.mp3"); song2=minim.loadFile("Undertale OST- 010 - Ghost Fight.mp3"); 
song3=minim.loadFile("Undertale OST- 004 - Fallen Down.mp3"); song4=minim.loadFile("Undertale Ost- 079 - Your Best Nightmare.mp3"); 
song5=minim.loadFile("Undertale OST- 017 - Snowy.mp3"); song6=minim.loadFile("Undertale OST- 021 - Dogsong.mp3"); 
song7=minim.loadFile("Undertale OST- 065 - CORE.mp3"); song8=minim.loadFile("Undertale OST- Bergentrückung-ASGORE.mp3"); 
song9=minim.loadFile("Undertale- Hopes and Dreams+Save the World.mp3"); 
frameRate(10);
Difficulte=loadImage("difficulte.png");
Pause=loadImage("pause.png");
perso=loadImage("persoC.png");
mechant=loadImage("zombieD.png");
mechant2=loadImage("arbreH.png");
mechant3=loadImage("zombieD.png");
gentleman=loadImage("zombieGT.png");
bulle=loadImage("bulle.png");
carotte=loadImage("Carotte.png");
carotte2=loadImage("Carotte2.png");
clef=loadImage("clef.png");
clef2=loadImage("clef2.png");
terrain4 = loadImage("terrain4v1.png");
caisse =loadImage("caisse.png");
Coeur=loadImage("Coeur.png");
yeti= loadImage("yeti.png"); FIN = loadImage("fin.png");
}
 
 
 
void draw() {
if(difficulte==0) { if(SONG==0){ song.play(); song.loop(); SONG=1;}
if(mouseX<=753 && mouseX>=148 && mouseY<=376 && mouseY>=223){Difficulte=loadImage("difficulte1.png"); if(mousePressed){frame=3; difficulte=1; SONG=2;}} else {
if(mouseX<=753 && mouseX>=148 && mouseY<=601 && mouseY>=448){Difficulte=loadImage("difficulte2.png"); if(mousePressed){frame=2; difficulte=1; SONG=2;}} else {
if(mouseX<=753 && mouseX>=148 && mouseY<=826 && mouseY>=673){Difficulte=loadImage("difficulte3.png"); if(mousePressed){frame=1; difficulte=1; SONG=2;}} else {
Difficulte=loadImage("difficulte.png");}}}
image(Difficulte,0,0);}
 
 
if(difficulte==1){
  if(game==1){
if(terrain==1) {terrain1(); }
if(terrain==2) {terrain2(); }
if(terrain==3) {terrain3(); }
if(terrain==4) {terrain4(); }
if(terrain==5) {terrain5(); }
if(terrain==6) {terrain6();}
if(terrain==7) {terrain7();}
if(terrain==8) {terrain8();}
//rect(persoX,persoY,50,50);
if(para==0) {bougerPerso();}
imageperso();
//dessinerDamier();
ennemi();
if(terrain==6) {yeti();}
condition();
collision();
perdu();
PNJ();
objet();
music();
}
else if (game==0){gameover(); }}
if(difficulte==3){ outro();
if(SONG==9){song8.pause(); song4.pause(); song9.play(); song9.loop(); SONG=0;}} 
}
 
void outro () {
//génère des confettis de couleur aléatoire et changeante, pour l’écran de fin
 image(FIN,0,0);
 for(int i=0; i<listeY.size();i=i+1) {fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));   ellipse(listeX.get(i),listeY.get(i),20,20);}
if((int)random(0,4)==0){ int X = int(random(0,900));
  listeX.append(X);
  listeY.append(0);}
  for(int i=0; i<listeX.size();i=i+1) {
  listeY.set(i,listeY.get(i)+4); }}
 
void keyPressed() {
//gère la pause, quand la touche p est pressée
  if (key == 'p') {pause=pause+1;}
if(pause%2==0){noLoop(); image(Pause,0,0); }else { loop();}}
 
void gameover() {
//gère l’écran après la mort du personnage
 if(mouseX<=817 && mouseX>=98 && mouseY<=811 && mouseY>=689){ gameover=loadImage("gameover2.png"); 
if(mousePressed){if(TRY==0){m=1; terrain=1; persoX=375; persoY=750; restart=0; perso=loadImage("persoM.png"); game=1; coeur=3; mort=0; para=0; GO=0; GO2=1;SONG=2; }
else if(TRY==1){m=5; terrain=5; persoX=300; persoY=750; restart=7;  perso=loadImage("persoM.png"); game=1; coeur=3; mort=0; para=0; GO=0; GO2=1; SONG=5; }}}
else { gameover=loadImage("gameover.png"); } background(0);image(gameover,0,0);}
 
 
 
void bougerPerso() {
//déplace le personnage selon la touche pressée, sélectionne une image plus sombre si il se trouve dans un terrain sombre
 if(dark==1){ if(keyPressed){
  if(key==CODED){
if(keyCode==UP){perso=loadImage("persoHd.png");
}
if(keyCode==UP && collB==0){persoY=persoY-75;
}
if(keyCode==DOWN){perso=loadImage("persoBd.png");
}
if(keyCode==DOWN && collH==0){ persoY=persoY+75;
}
if(keyCode==LEFT){perso=loadImage("persoGd.png");
 }
if(keyCode==LEFT && collD==0){ persoX=persoX-75;
}
if(keyCode==RIGHT){perso=loadImage("persoDd.png");
}
if(keyCode==RIGHT && collG==0){ persoX=persoX+75;
}
}} if(keyCode==SHIFT){ perso=loadImage("persoCd.png"); textSize(20); text("il fait sombre...",persoX-30,persoY-5);} } else {
 
if(keyPressed){
  if(key==CODED){
if(keyCode==UP){perso=loadImage("persoH.png");
}
if(keyCode==UP && collB==0){persoY=persoY-75;
}
if(keyCode==DOWN){perso=loadImage("persoB.png");
}
if(keyCode==DOWN && collH==0){ persoY=persoY+75;
}
if(keyCode==LEFT){perso=loadImage("persoG.png");
 }
if(keyCode==LEFT && collD==0){ persoX=persoX-75;
}
if(keyCode==RIGHT){perso=loadImage("persoD.png");
}
if(keyCode==RIGHT && collG==0){ persoX=persoX+75;
}
}} if(keyCode==SHIFT){ perso=loadImage("persoC.png"); textSize(20); text("Dédicace à l'équipe",persoX-50,persoY-5);} }
}
 
void imageperso() {
//affiche l’image du personnage, celles des objets qu’il a ramassés, et ses vies restantes
image(perso,persoX,persoY,75,75);
if(objclef2==1){rect(825+5,0,60,60,20); image(clef,825+8,2,60,60);}
if(objcarotte==1){rect(825+5,0,60,60,20); image(carotte,825+5,2,60,60);}
if(coeur==3){image(Coeur,0,0,75,75); image(Coeur,75,0,75,75); image(Coeur,150,0,75,75); } else if(coeur==2){image(Coeur,0,0,75,75); image(Coeur,75,0,75,75); } else if(coeur==1){image(Coeur,0,0,75,75); }}
 
void terrain1() {
//affiche l’image du terrain, gère la sortie de ce terrain
PImage terrain1; 
terrain1 = loadImage("Terrain1.png");
image(terrain1,0,0);
if(persoX==300 && persoY==0){ sortie=1;}
}
 
void terrain2() {
//affiche l’image du terrain, gère les sorties et la possibilité de ramasser la clef
PImage terrain2; dark=0;
terrain2 = loadImage("Terrain2.png");
image(terrain2,0,0);
if(persoX==300 && persoY==825){ sortie=2;}
if(persoX==450 && persoY==0){ sortie=3;}
if(persoX==0 && persoY==225) {sortie=5;}
if(persoX==150 && persoY==750) {posobjclef=1;}
if(posobjclef==0 && objclef==1){image(clef,150,750);}}
 
void terrain3() {
//affiche l’image du terrain, gère les sorties
PImage terrain3;
terrain3 = loadImage("Terrain3.png");
image(terrain3,0,0);
if(persoX==450 && persoY==825){ sortie=4;}
if(persoX==300 && persoY==0){ sortie=7;}}
 
void terrain4() {
//
if(objclef2==1 && persoX==450 && persoY==600){if(key=='a'){cabane=1; objclef2=0; perso= loadImage("persoHd.png") ;terrain4 = loadImage("terrain4v1.2.png"); }}
if(cabane==1) {if( persoX<=600 && persoX>=300 && persoY<=525 && persoY>=300){ terrain4 = loadImage("terrain4v2.png"); } else { terrain4 = loadImage("terrain4v1.2.png");}}
if(persoX==600 && persoY==375) { if(key=='a'){terrain4 = loadImage("terrain4v3.png"); perso=loadImage("persoHd.png"); cabane=2; CCa=1; }}
if(cabane==2) {if( persoX<=600 && persoX>=300 && persoY<=525 && persoY>=300){terrain4 = loadImage("terrain4v3.png"); } else { terrain4 = loadImage("terrain4v1.2.png");}}
image(terrain4,0,0); dark=1;
if(persoX==825 && persoY==225) {sortie=6;}
}
 
void terrain5() {  
PImage terrain5;
terrain5 = loadImage("map transition.bmp");
image(terrain5,0,0);
if(persoX==300 && persoY==825) {sortie=8;}
if(persoX==375 && persoY==0) {sortie=9;}
if(persoX==450 && persoY==0) {sortie=11;}
}
 
void terrain6() {  
PImage terrain6; 
terrain6 = loadImage("terrain6.png");
image(terrain6,0,0);
if(persoX==375 && persoY==825) {sortie=10;}
if(persoX==450 && persoY==825) {sortie=12;}
if(persoX==375 && persoY==0) {sortie=13;}
}
 
void terrain7() {
  PImage terrain7;
  terrain7= loadImage("map entree grotte.png");
  image(terrain7,0,0);
  if (persoX==450 && persoY==825){sortie=14;}
  if (persoY<=675 && persoY>=300 && persoX<=300 && persoX>=0) { mort=1; GO=1;}
  if (persoY<=675 && persoY>=300 && persoX<=900 && persoX>=525) { mort=1; GO=1;}
 if (persoX==375 && persoY==150){sortie=15;}
 if (persoX==450 && persoY==150){sortie=16;}}
  
  void terrain8() {
  PImage terrain8;
  terrain8= loadImage("map boss.png");
  image(terrain8,0,0); dark=1;
 if (persoX==375 && persoY==825){sortie=17;}
 if (persoX==450 && persoY==825){sortie=18;}}
 
 
 
void collision() {
if(terrain==1) {
if(persoX==375 && persoY==450)  {collG=1;} else {
if(persoX==300 && persoY>225 && persoY<450)  {collG=1;} else {
if(persoX==150 && persoY==600)  {collG=1;} else {
if(persoX==300 && persoY==75) {collG=1;} else {
if(persoX==675 && persoY>300 && persoY<675) {collG=1;} else {
if(persoY==225 && persoX==75){collG=1; } else {
if(persoX==300 && persoY==0){collG=1;} else {if (persoX==825-75) {
collG=1;} else {
  if(persoX==600 && persoY==150){
collG=1;}
else {if(persoX==75 && persoY==525){
collG=1;} else { collG=0; }}}}}}}}}}
 
if(persoX==600 && persoY==375){collD=1;} else {
if(persoX==525 && persoY>225 && persoY<525){collD=1;} else {
if(persoX==300 && persoY>450 && persoY<675) {collD=1;} else {
if(persoX==300 && persoY==750) {collD=1;} else {
if(persoX==600 && persoY==75) {collD=1;} else {
if(persoX==300 && persoY==75) {collD=1;} else {
if(persoX==225 && persoY==225) { collD=1; } else {
if(persoX==150 && persoY==150){collD=1;} else {
if(persoX==300 && persoY==0){collD=1;} else { if (persoX==0+75) {
collD=1; } else {
if(persoX==750 && persoY==150){
 collD=1; }
else{ if(persoX==225 && persoY==525){
collD=1;
} else { collD=0; }}}}}}}}}}}}
 
if(persoX==225 && persoY==450) { collH=1;} else {
if(persoX==525 && persoY==300) { collH=1;} else {
if(persoY==225 && persoX>300 && persoX<525) {collH=1;} else {
if(persoY==675 && persoX>0 && persoX<300) {collH=1;} else {
if(persoX==750 && persoY==300) { collH=1;} else {
if(persoX==150 && persoY==150){collH=1;} else {
if(persoY==825-75) { collH=1;} else {
if(persoY==75 && persoX==675){
 collH=1;}
else{ if(persoY==450 && persoX==150){
collH=1;
 } else { collH=0; }}}}}}}}}
 
if(persoX==450 && persoY==525)  {collB=1;} else {
if(persoX>300 && persoX<600 && persoY==450)  {collB=1;} else {
if(persoX==225 && persoY==675)  {collB=1;} else {
if(persoX==750 && persoY==675){ collB=1;} else {
if(persoX==150 && persoY==300) {collB=1;} else {
if(persoY==150 && persoX>0 && persoX<300) {collB=1;} else {
if(persoY==150 && persoX>300 && persoX<600) {collB=1;} else {
if(persoY==225 && persoX==75){collB=1; } else {
if(persoY==75 && persoX==300) {collB=0;} else { if(persoY==0){collB=1;} else {  if(persoY==75){ collB=1;}
else {
if(persoY==225 && persoX==675){ collB=1;} else {
if(persoY==600 && persoX==150){collB=1;} else {
collB=0; }}}}}}}}}}}}}
}
 
if(terrain==2) {
if(persoX==300 && persoY<900 && persoY>525) { collD=1;} else {
if(persoX==150 && persoY<600 && persoY>300) { collD=1;} else {
if(persoX==750 && persoY==600) { collD=1;} else {
if(persoX==525 && persoY==375) { collD=1;} else {
if(persoX==675 && persoY==450) { collD=1;} else {
if(persoX==375 && persoY==450) { collD=1;} else {
if(persoX==450 && persoY==675) { collD=1;} else {
if(persoX==150 && persoY==75) { collD=1;} else {
if(persoX==75 && persoY==225) {collD=0;} else {
if(persoX==75)  {collD=1;} else{ collD=0;}}}}}}}}}}
 
if(persoX==225 && persoY==375) { collG=1;} else {
if(persoX==150 && persoY==450) { collG=1;} else {
if(persoX==300 && persoY==675) { collG=1;} else {
if(persoX==600 && persoY==600) { collG=1;} else {
if(persoX==600 && persoY==75) { collG=1;} else {
if(persoX==150 && persoY<900 && persoY>525) { collG=1;} else {
if(persoX==375 && persoY==450) { collG=1;} else {
if(persoX==675 && persoY==450) { collG=1;} else {
if(persoX==750){collG=1;} else { collG=0;}}}}}}}}}
 
if(persoY==300 && persoX<525 && persoX>225) { collH=1;} else {
if(persoY==375 && persoX<675 && persoX>450) { collH=1;} else {
if(persoX==675 && persoY==525) { collH=1;} else {
if(persoX==225 && persoY==375) { collH=1;} else {
if(persoX==75 && persoY==300) { collH=1;} else {
if(persoX==750 && persoY==375) { collH=1;} else {
if(persoX==375 && persoY==600) { collH=1;} else {
if(persoX==225 && persoY==525) { collH=1;} else {
if(persoX==300 && persoY==750) { collH=0;} else {
if(persoY==750){collH=1;} else {collH=0;}}}}}}}}}}
 
if(persoX==450 && persoY==75) { collB=0;} else {
if(persoY==150 && persoX<825 && persoX>600) { collB=1;} else {
if(persoY==525 && persoX<375 && persoX>150) { collB=1;} else {
if(persoY==525 && persoX<675 && persoX>375) { collB=1;} else {
if(persoX==75 && persoY==150) { collB=1;} else {
if(persoX==375 && persoY==450) { collB=1;} else {
if(persoX==750 && persoY==525) { collB=1;} else {
if(persoX==675 && persoY==675) { collB=1;} else {
if(persoX==375 && persoY==750) { collB=1;} else {
if(persoX==75 && persoY==600) { collB=1;} else {
if(persoX==225 && persoY==525) { collB=1;} else {
if(persoY==75){collB=1;} else {collB=0;}}}}}}}}}}}}
}
 
if(terrain==3){
  if (persoX==75) {collD=1;} else {
  if(persoX==450 && persoY==675) {collD=1;} else {
  if(persoX==300 && persoY==300) {collD=1;} else {
  if(persoX==300 && persoY==150) {collD=1;} else {
  if(persoX==225 && persoY==225) {collD=1;} else {
  if(persoX==225 && persoY==75) {collD=1;} else {
  if(persoX==525 && persoY>70 && persoY<300) {collD=1;} else {
  if(persoX==675 && persoY==675) {collD=1;} else {
 
  if(persoX==675 && persoY==375) {collD=1;}
  else {collD=0;}}}}}}}}}
 
if(persoX==750) {collG=1;} else {
if(persoX==300 && persoY==0) {collG=1;} else {
if(persoX==300 && persoY==75) {collG=1;} else {
if(persoX==375 && persoY==150) {collG=1;} else{
if(persoX==300 && persoY==225) {collG=1;} else {
if(persoX==300 && persoY==675) {collG=1;} else {
if(persoX==525 && persoY==675) {collG=1;} else{
 
if(persoX==675 && persoY==375) {collG=1;}
else {collG=0;}}}}}}}}
 
 if(persoX==75 && persoY<525) {collB=1;} else {
 if(persoX==150 && persoY<525) {collB=1;} else {
 if(persoX==450 && persoY<375) {collB=1;} else {
 if(persoX==225 && persoY==75) {collB=1;} else {
 if(persoX==225 && persoY==225) {collB=1;} else {
 if(persoX==375 && persoY==150) {collB=1;} else {
 if(persoX==375 && persoY==300) {collB=1;} else {
 if(persoX<825 && persoX>450 && persoY==75) {collB=1;} else {
 if(persoX>75 && persoX<675 && persoY==450)  {collB=1;} else {
 if(persoX==750 && persoY==450) {collB=1;} else {
 if(persoX==375 && persoY==750) {collB=1;} else {
 if(persoX==600 && persoY==750) {collB=1;}
else {collB=0;} }}}}}}}}}}}
if(persoX==225 && persoY==75) {collH=1;} else {
if(persoX==225 && persoY==225) {collH=1;} else{
if(persoX==375 && persoY==150) {collH=1;} else {
if(persoX>225 && persoX<675 && persoY==300) {collH=1;} else{
if(persoX==750 && persoY==300) {collH=1;} else {
if(persoX==375 && persoY==600) {collH=1;} else{
if(persoX==600 && persoY==600) {collH=1;} else {
if(persoX>0 && persoX<450 && persoY==750) {collH=1;} else {
 
if(persoX>450 && persoX<900 && persoY==750) {collH=1;}
else {collH=0;}}}}}}}}}
}
 
if(terrain==4) {
 
if(persoY==525 && persoX==300) {collH=1;} else {
if(persoY==450 && persoX==375) {collH=1;} else {
if(persoY==450 &&  persoX>=525 && persoX<=600) {collH=1;} else {
if(persoY==caisseY-75 && persoX==caisseX){ collH=1;} else {
if(persoY==225 && persoX>=300 && persoX<=600) { collH=1;} else {
if(persoY==675) { collH=1;} else { collH=0;}}}}}}
 
if(cabane==0  && persoX==450 && persoY==600) { collB=1;} else {
if(cabane>=1 &&  persoX==450 && persoY==600) { collB=0;} else {
if(persoY==600 && persoX>=300 && persoX<=600) {collB=1;} else {
if(persoY==675 && persoX==375){collB=1;} else {
if(persoY==450 && persoX==450){collB=1;} else {
if(persoY==450 && persoX==300){collB=1;} else {
if(persoY==375 && persoX<=600 && persoX>=300){ collB=1;  } else {  
if(persoY==225) { collB=1; } else { collB=0;} }}}}}}}
 
if(persoX==525 && persoY==375){collD=1;} else {
if(persoX==375 && persoY==375){collD=1;} else {
if(persoX==450 && persoY==600){collD=1;} else {
if(persoY>=300 && persoY<=525 && persoX==300) { collD=1;} else {
if(persoX==450 && persoY==525) {collD=1;} else {
if(persoY>=300 && persoY<=525 && persoX==675) { collD=1;} else {
if(persoX==225) {collD=1;} else { collD=0;}}}}}}}
 
if(persoX==300 && persoY==525){ collG=1;} else {
if(persoX==375 && persoY==375){collG=1;} else {
if(persoX==300 && persoY==600){collG=1;} else {
if(persoY>=300 && persoY<=525 && persoX==600) { collG=1;} else {
if(persoX==450 && persoY==525) {collG=1;} else {
if(persoY>=300 && persoY<=525 && persoX==225) { collG=1;} else {
if(persoX==750 && persoY==225) {collG=0;} else {if(persoX==750){collG=1;} else {
if(persoY==caisseY && persoX==caisseX-75){ collG=1;} else {collG=0;}  }}}}}}}}}
 
if(terrain==5) {
 
 
 
 
if(persoX==300 && persoY==750) {collD=1;} else {
if(persoX==300 && persoY==825) {collD=1;} else {
if(persoX==375 && persoY==675) {collD=1;} else {
if(persoX==375 && persoY==600) {collD=1;} else {
if(persoX==75 && persoY==600) {collD=1;} else {
if(persoX==150 && persoY==525) {collD=1;} else {
if(persoX==375 && persoY==450) {collD=1;} else {
if(persoX==375 && persoY==375) {collD=1;} else {
if(persoX==75 && persoY==375) {collD=1;} else {
if(persoX==75 && persoY==300) {collD=1;} else {
if(persoX==375 && persoY==225) {collD=1;} else {
if(persoX==375 && persoY==150) {collD=1;} else {
if(persoX==75 && persoY==150) {collD=1;} else {
if(persoX==375 && persoY==0) {collD=1;} else {
if(persoX==300 && persoY==75) {collD=1;} else {
if(persoX==600 && persoY==375) {collD=1;} else {
if(persoX==600 && persoY==600) {collD=1;} else {
if(persoX==225 && persoY==375) {collD=1;} else {
if(persoX==750 && persoY==525) {collD=1;} else {collD=0;
}}}}}}}}}}}}}}}}}}}
 
if(persoX==225 && persoY==375) { collG=1;} else {
if(persoX==225 && persoY==600) { collG=1;} else {
if(persoX==300 && persoY==825) {collG=1;} else {
if(persoX==525 && persoY==750) {collG=1;} else {
if(persoX==450 && persoY==675) {collG=1;} else {
if(persoX==450 && persoY==600) {collG=1;} else {
if(persoX==750 && persoY==600) {collG=1;} else {
if(persoX==750 && persoY==525) {collG=1;} else {
if(persoX==600 && persoY==525) {collG=1;} else {
if(persoX==450 && persoY==450) {collG=1;} else {
if(persoX==450 && persoY==375) {collG=1;} else {
if(persoX==450 && persoY==225) {collG=1;} else {
if(persoX==450 && persoY==150) {collG=1;} else {
if(persoX==750 && persoY==375) {collG=1;} else {
if(persoX==750 && persoY==300) {collG=1;} else {
if(persoX==450 && persoY==0) {collG=1;} else {
if(persoX==525 && persoY==75) {collG=1;} else {collG=0;}
  }}}}}}}}}}}}}}}}
 
if(persoX==300 && persoY==750) {collB=1;} else {
if(persoX==75 && persoY==600) {collB=1;} else {
if(persoX==150 && persoY==525) {collB=1;} else {
if(persoX>150 && persoX<375 && persoY==525) {collB=1;} else{
if(persoX>0 && persoX<375 && persoY==300) {collB=1;} else{
if(persoX==300 && persoY==75) {collB=1;} else {
if(persoX==525 && persoY==75) {collB=1;} else {
if(persoX>450 && persoX<825 && persoY==300) {collB=1;} else{
if(persoX>450 && persoX<675 && persoY==525) {collB=1;} else{
if(persoX==750 && persoY==525) {collB=1;} else {   
if(persoX==525 && persoY==750) {collB=1;} else {
if(persoX==675 && persoY==600) {collB=1;} else { collB=0;}
}}}}}}}}}}}
 
if(persoX==300 && persoY==75) {collH=1;} else {
if(persoX==300 && persoY==300) {collH=1;} else {
if(persoX==300 && persoY==525) {collH=1;} else {
if(persoX>0 && persoX<375 && persoY==375) {collH=1;} else{
if(persoX>0 && persoX<375 && persoY==600) {collH=1;} else{
if(persoX==525 && persoY==75) {collH=1;} else {
if(persoX==525 && persoY==300) {collH=1;} else {
if(persoX>450 && persoX<825 && persoY==375) {collH=1;} else{
if(persoX==525 && persoY==525) {collH=1;} else {
if(persoX>300 && persoX<675 && persoY==750) {collH=1;} else{
if(persoX>450 && persoX<825 && persoY==600) {collH=1;} else{ collH=0;}
}}}}}}}}}}}
 
 
if(terrain==6) {
 if(persoX==375 && persoY==750 || persoX==450 && persoY==750){collH=0;} else {
if(persoY==750) {collH=1;} else{
if(persoX==225 && persoY==525) {collH=1;} else {
if(persoX==150 && persoY==450) {collH=1;} else {
if(persoX==300 && persoY==225) {collH=1;} else {
if(persoX==150 && persoY==75) {collH=1;} else {
if(persoX==675 && persoY==75) {collH=1;} else {
if(persoX==600 && persoY==225) {collH=1;} else {
if(persoX==525 && persoY==450) {collH=1;} else {
if(persoX==675 && persoY==600) {collH=1;} else {
if(persoX==450 && persoY==600) {collH=1;} else {
collH=0;}}}}}}}}}}}
    
if(persoX==225 && persoY==675) {collB=1;} else {
if(persoX==150 && persoY==600) {collB=1;} else {
if(persoX==300 && persoY==375) {collB=1;} else {
if(persoX==150 && persoY==225) {collB=1;} else {
if(persoX==450 && persoY==150) {collB=1;} else {
if(persoX==675 && persoY==225) {collB=1;} else {
if(persoX==600 && persoY==375) {collB=1;} else {
if(persoX==525 && persoY==600) {collB=1;} else {
if(persoX==675 && persoY==750) {collB=1;} else {
if(persoX==450 && persoY==750) {collB=1;} else {
 if(persoX==375 && persoY==75){collH=0;} else {
if(persoY==75) {collB=1;} else {
 {collB=0;}}}}}}}}}}}}}
 
if(persoX==75) { collD=1;} else {
if(persoX==300 && persoY==600) {collD=1;} else {
if(persoX==225 && persoY==525) {collD=1;} else {
if(persoX==375 && persoY==300) {collD=1;} else {
if(persoX==225 && persoY==150) {collD=1;} else {
if(persoX==525 && persoY==75) {collD=1;} else {
if(persoX==750 && persoY==150) {collD=1;} else {
if(persoX==675 && persoY==300) {collD=1;} else {
if(persoX==600 && persoY==525) {collD=1;} else {
if(persoX==750 && persoY==675) {collD=1;} else {
if(persoX==525 && persoY==675) {collD=1;} else {
collD=0;}}}}}}}}}}}
 
if(persoX==750) { collG=1;} else {
if(persoX==150 && persoY==600) {collG=1;} else {
if(persoX==75 && persoY==525) {collG=1;} else {
if(persoX==225 && persoY==300) {collG=1;} else {
if(persoX==75 && persoY==150) {collG=1;} else {
if(persoX==375 && persoY==75) {collG=1;} else {
if(persoX==600 && persoY==150) {collG=1;} else {
if(persoX==525 && persoY==300) {collG=1;} else {
if(persoX==450 && persoY==525) {collG=1;} else {
if(persoX==600 && persoY==675) {collG=1;} else {
if(persoX==375 && persoY==675) {collG=1;} else {
collG=0;}}}}}}}}}}}
 
 
 }
if(terrain==7) {
if(persoX==75 && persoY==750) {collD=1;} else {
if(persoX==75 && persoY==225) {collD=1;} else {
if(persoX==450 && persoY==825) {collD=1;} else {
if(persoX==375 && persoY>225 && persoY<750) {collD=1;} else{
if(persoX==375 && persoY==150) {collD=1;} else {
if(persoX==375 && persoY==75) {collD=1;} else { collD=0;
}}}}}}
 
if(persoX==750 && persoY==750) {collG=1;} else {
if(persoX==750 && persoY==225) {collG=1;} else {
if(persoX==450 && persoY==825) {collG=1;} else {
if(persoX==450 && persoY>225 && persoY<750) {collG=1;} else{
if(persoX==450 && persoY==150) {collG=1;} else {
if(persoX==450 && persoY==75) {collG=1;} else { collG=0;
}}}}}}
 
if(persoX==375 && persoY==75) {collB=0;} else {
if(persoX>0 && persoX<375 && persoY==225) {collB=1;} else{
if(persoX>450 && persoX<825 && persoY==225) {collB=1;} else{collB=0;
}}}
 
if(persoX>0 && persoX<450 && persoY==750) {collH=1;} else{
if(persoX>450 && persoX<825 && persoY==750) {collH=1;} else{collH=0;}
}}
 
if(terrain==8) {
if(persoX==gentleX+75 && persoY==gentleY) {collD=1;} else {
if(persoX==75) {collD=1;} else {collD=0;}}
 
if(persoX==gentleX-75 && persoY==gentleY) {collG=1;} else {
if(persoX==750) {collG=1;} else { collG=0;}}
 
if(persoX==gentleX && persoY==gentleY+75) {collB=1;} else {
if(persoY==75){collB=1;} else { collB=0;}}
 
if(persoX<=450 && persoX>=375 && persoY==750) {collH=0;} else {
if(persoX==gentleX && persoY==gentleY-75) {collH=1;} else { 
if(persoY==750){collH=1;} else { collH=0;}}}
}}
 
 void ennemi() {
if(terrain==1) {image(mechant,mechantX,mechantY,75,75); mechant2=loadImage("vide.png"); mechant3=loadImage("vide.png"); mechant4=loadImage("vide.png"); mechant5=loadImage("vide.png");
if(mechantX==225) { marche=1; mechant=loadImage("zombieD.png");} else{ if(mechantX==750) { marche=0; mechant=loadImage("zombieG.png");}}
if(frameCount%frame==0) {if(mechantX>=225 && mechantX<750 && marche==1) {mechantX=mechantX+75; }
else { mechantX=mechantX-75; } }}
 
if(terrain==2) { image(mechant,mechantX,mechantY,75,75); mechant2=loadImage("arbreH.png"); mechant3=loadImage("arbreD.png");  mechant4=loadImage("arbreD.png"); mechant5=loadImage("arbreB.png");
if(mechantX==150 && mechant2Y>75) { marche=1; mechant=loadImage("zombieD.png");} else{ if( mechantX>0 && mechant2Y==75 && mechantX<=225){marche=1; mechant=loadImage("zombieD.png");}  else{ if(mechantX==600) { marche=0; mechant=loadImage("zombieG.png");}}}
if(frameCount%frame==0) {if(marche==1) {mechantX=mechantX+75; }
else { mechantX=mechantX-75; }}
 
image(mechant2,mechant2X,mechant2Y,75,75);
if(mechant2X==persoX && persoY<mechant2Y){marcheA1=1;} if(frameCount%frame==0) {if(marcheA1==1 && mechant2Y>75){mechant2Y=mechant2Y-75;}}
 
image(mechant3,mechant3X,mechant3Y,75,75);
if(mechant3Y==persoY && persoX>mechant3X){marcheA2=1;} if(frameCount%frame==0) {if(marcheA2==1 && mechant3X<750){mechant3X=mechant3X+75;}}
image(mechant4,mechant4X,mechant4Y,75,75);
if(mechant4Y==persoY && persoX>mechant4X){marcheA3=1;} if(frameCount%frame==0) {if(marcheA3==1 && mechant4X<750){mechant4X=mechant4X+75;}}
image(mechant5,mechant5X,mechant5Y,75,75);
if(mechant5X==persoX && persoY<675 && persoY>375){marcheA4=1;} if(frameCount%frame==0) {if(marcheA4==1 && mechant5Y<600){mechant5Y=mechant5Y+75;}}}
 
if(terrain==3) {image(mechant,mechantX,mechantY,75,75); mechant2=loadImage("vide.png"); mechant3=loadImage("vide.png"); mechant4=loadImage("vide.png");
if(mechantX==525 && mechantY==600) { marche=1; }
if(mechantX==675 && mechantY==600) { marche=2;}
if(mechantX==675 && mechantY==750) { marche=3;}
if(mechantX==525 && mechantY==750) { marche=4; }
if(frameCount%frame==0) {if(marche==1) {mechantX=mechantX+75; mechant=loadImage("zombieD.png");} else {
 if(marche==2) {mechantY=mechantY+75; mechant=loadImage("zombie.png");} else {
 if(marche==3) {mechantX=mechantX-75; mechant=loadImage("zombieG.png");} else {
 if(marche==4) {mechantY=mechantY-75;mechant=loadImage("zombieH.png"); }}}}
}}
if(terrain==8) { image(mechant,mechantX,mechantY,75,75); image(mechant2,mechant2X,mechant2Y,75,75); image(mechant3,mechant3X,mechant3Y,75,75); image(mechant4,mechant4X,mechant4Y,75,75);
if(frameCount%6==0){ mechant=loadImage("boss1.png"); mechant2=loadImage("boss3.png"); mechant3=loadImage("boss1.png"); mechant4=loadImage("boss2.png"); }
if(frameCount%6==2){ mechant=loadImage("boss2.png"); mechant2=loadImage("boss2.png"); mechant3=loadImage("boss3.png"); mechant4=loadImage("boss1.png"); }
if(frameCount%6==4){ mechant=loadImage("boss3.png"); mechant2=loadImage("boss1.png"); mechant3=loadImage("boss2.png"); mechant4=loadImage("boss3.png"); }}
}
 
void PNJ() {
if(terrain==3){
if(Gentleman==0) { image(gentleman,gentleX,gentleY); if(persoX==675 && persoY==450) {collB=1;}
if(persoX==675 && persoY==450) {if(key=='a'){ if(keyPressed){text=1;}}}
if(text==1) {if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){bulle=loadImage("bulle2.png");} else {bulle=loadImage("bulle.png");} perso=loadImage("persoH.png"); image(bulle,0,0); para=1;
if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){ if(mousePressed){text=0; para=0; }}
if(objcarotte==1){text=2;}}
if(text==2){if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){bulle=loadImage("bulle4.png");} else if(mouseX>42 && mouseX<852 && mouseY>799 && mouseY<876){bulle=loadImage("bulle5.png");}
else { bulle=loadImage("bulle3.png");} image(bulle,0,0); para=1; if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){ if(mousePressed){text=0; para=0; }}
if(mouseX>42 && mouseX<852 && mouseY>799 && mouseY<876){if(mousePressed){text=3; gentleman=loadImage("zombieGHB.png"); objcarotte=2; tempsG=0;}}}
if(text==3){if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){bulle=loadImage("bulle7.png");}  else {bulle=loadImage("bulle6.png");} image(bulle,0,0); para=1;
if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){if(mousePressed){ Gentleman=1; tempsG=0; }}}}
 
if(Gentleman==1) {image(gentleman,gentleX,gentleY); tempsG=tempsG+1;  if(tempsG==15){gentleman=loadImage("zombieGHH.png"); gentleY=gentleY-75; } if(tempsG==25){gentleman=loadImage("zombieGHD.png"); gentleX=gentleX+75; } if(tempsG==35){gentleman=loadImage("zombieGHG.png");}
if(tempsG==40){Gentleman=2; tempsG=0; para=0; text=0;}}
 
if(Gentleman==2) {if(persoX==675 && persoY==300) {collG=1;} if(persoX==750 && persoY==225) {collH=1;} image(gentleman,gentleX,gentleY);
if(persoX==675 && persoY==300) {if(key=='a'){if(keyPressed){text=1;}}} if(persoX==750 && persoY==225) {if(key=='a'){if(keyPressed){text=2;}}}
if(text==1){if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){bulle=loadImage("bulle9.png");} else {bulle=loadImage("bulle8.png");}  image(bulle,0,0); para=1; perso=loadImage("persoD.png");
if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){if(mousePressed){para=0; text=0; }}}
if(text==2){if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){bulle=loadImage("bulle9.png");} else {bulle=loadImage("bulle8.png");}  image(bulle,0,0); para=1; gentleman=loadImage("zombieGHH.png"); perso=loadImage("persoB.png");
if(mouseX>42 && mouseX<852 && mouseY>693 && mouseY<770){if(mousePressed){para=0; text=0;gentleman=loadImage("zombieGHG.png"); }}}}}
 
if(terrain==4){if( persoX<=600 && persoX>=300 && persoY<=525 && persoY>=300){ image(caisse,caisseX,caisseY);}
if(persoX==450 && persoY==450 && caisseX==525){ if(key=='a'){ perso=loadImage("persoDd.png"); caisseX=caisseX+75;}}}
 
if(terrain==8){ gentleX=450; gentleY=375; gentleman=loadImage("zombieGHBd.png"); image(gentleman,gentleX,gentleY-10);
if(persoX==450 && persoY==450){if(key=='a'){ if(keyPressed){text=3;}}}
if(text==3) { if(mouseX>42 && mouseX<852 && mouseY>593 && mouseY<670) {bulle=loadImage("bulle11.png");} else {bulle=loadImage("bulle10.png");} image(bulle,0,-100);}
if(mouseX>42 && mouseX<852 && mouseY>593 && mouseY<670){ if(mousePressed){SONG=9; difficulte=3; }}
}}
 
void perdu() {
  if(persoY==mechantY && persoX==mechantX) {
 mort=1;GO=1; }
if(persoY==mechant2Y && persoX==mechant2X) {
 mort=1; GO=1;}
  if(persoY==mechant3Y && persoX==mechant3X) {
 mort=1; GO=1;}
 if(persoY==mechant4Y && persoX==mechant4X) {
 mort=1; GO=1;}
 if(persoY==mechant5Y && persoX==mechant5X) {
 mort=1; GO=1; }
  if(persoY==yetiY && persoX==yetiX && terrain==6) {
 mort=1; GO=1; if(yetiY==750) {yetiX=600; yetiY=600; } }
 if(mort==1) { perso=loadImage("persoM.png"); para=1;
 if(mouseX<=822 && mouseX>=84 && mouseY<=789 && mouseY>=636){Mort=loadImage("perdu2.png");if(mousePressed){ mort=0; para=0; GO=0; GO2=1;
 if(restart==0) {persoX=375; persoY=750; } else if(restart==1) {persoX=300; persoY=750; marcheA1=0; marcheA2=0; marcheA3=0; marcheA4=0; mechant2X=150; mechant2Y=675; mechant3X=75;  mechant3Y=300; mechant4X=75;  mechant4Y=150; mechant5X=375;  mechant5Y=450; }
 else if(restart==2) {persoX=300; persoY=75; } else if(restart==3) {persoX=450; persoY=750;}
 else if(restart==4) { persoX=450; persoY=75;  marcheA1=0; marcheA2=0; marcheA3=0; marcheA4=0; mechant2X=150; mechant2Y=675; mechant3X=75;  mechant3Y=300; mechant4X=75;  mechant4Y=150; mechant5X=375;  mechant5Y=450;}
 else if(restart==5) {persoX=750; persoY=225; }
 else if (restart==11) { persoX=450; persoY=750;}
 else if(restart==6) { persoX=75; persoY=225;  marcheA1=0; marcheA2=0; marcheA3=0; marcheA4=0; mechant2X=150; mechant2Y=675; mechant3X=75;  mechant3Y=300; mechant4X=75;  mechant4Y=150; mechant5X=375;  mechant5Y=450; }
 else if(restart==7) {persoX=300; persoY=825; }   else if(restart==8) {persoX=300; persoY=75; }  else if(restart==9) { persoX=300; persoY=750;} else if (restart==10) {sortie=7; } else if (restart==12) {persoX=375; persoY=750; }
 }}
 else {Mort=loadImage("perdu.png"); } image(Mort,0,0);}
 if(coeur==0) {game=0; SONG=4;}}
 
void objet () {
if(posobjclef==1 && objclef==1){ para=1; tempsC=tempsC+1; image(clef2,0,0);
if(tempsC==30){objclef=0; para=0; objclef2=1; tempsC=0;}}
if(objcarotte==0 && CCa==1 ){  para=1; tempsCa=tempsCa+1; image(carotte2,0,0); if(tempsCa==30){objcarotte=1; para=0; tempsCa=0; CCa=0;}}}
 
 
 
void condition () {
if(GO==1 && GO2==1){coeur=coeur-1; GO2=0;}
if(sortie==1) {m=2; terrain=2; persoX=300; persoY=750;  restart=1; sortie=0;}
if(sortie==2) {m=1; terrain=1; persoX=300; persoY=75; restart=2; sortie=0;}
if(sortie==3) {m=3; terrain=3; persoX=450; persoY=750; restart=3; sortie=0;}
if(sortie==4) {m=4; terrain=2; persoX=450; persoY=75; restart=4; sortie=0;}
if(sortie==5) {m=5; terrain=4; perso=loadImage("persoGd.png"); restart=5; persoX=750; persoY=225; sortie=0; SONG=3;}
if(sortie==6) {m=2; terrain=2; perso=loadImage("persoD.png"); restart=6; persoX=75; persoY=225; sortie=0; SONG=2;}
if(sortie==7) {m=5; terrain=5; persoX=300; persoY=750;restart=9; TRY=1; sortie=0; SONG=5;}
if(sortie==8) {m=3; terrain=3; persoX=300; persoY=75; restart=8; sortie=0; SONG=2;}
if(sortie==9) {m=6; terrain=6; persoX=375; persoY=750; restart=10; sortie=0;SONG=6;}
if(sortie==10) {m=5; terrain=5; persoX=375; persoY=75; restart=9; sortie=0;SONG=5;}
if(sortie==11) {m=6; terrain=6; persoX=450; persoY=750; restart=10; sortie=0;SONG=6;}
if(sortie==12) {m=5; terrain=5; persoX=450; persoY=75; restart=9; sortie=0;SONG=5;}
if(sortie==13) {m=5; terrain=7; persoX=450; persoY=750; restart=11; sortie=0;SONG=7;}
if(sortie==14) {m=5; terrain=6; persoX=375; persoY=75; restart=10; sortie=0;SONG=6;}
if(sortie==15) {m=7; terrain=8; perso=loadImage("persoHd.png"); persoX=375; persoY=750; restart=12; sortie=0;SONG=8;}
if(sortie==16) {m=7; terrain=8; perso=loadImage("persoHd.png"); persoX=450; persoY=750; restart=12; sortie=0; SONG=8;}
if(sortie==17) {m=5; terrain=7; perso=loadImage("persoB.png"); persoX=375; persoY=225; restart=11; sortie=0;SONG=7;}
if(sortie==18) {m=5; terrain=7; perso=loadImage("persoB.png"); persoX=450; persoY=225; restart=11; sortie=0; SONG=7;}
 
 
 
if(m==1 && terrain==1) { mechantX=225; mechantY=225;  mechant2X=0;  mechant2Y=0;  mechant3X=0;  mechant3Y=0; mechant4X=0;  mechant4Y=0; mechant5X=0;  mechant5Y=0; m=0;}
if(m==2 && terrain==2) {marcheA1=0; marcheA2=0; marcheA3=0; marcheA4=0; mechant2X=150; mechant2Y=675; mechantX=150; mechantY=75; mechant3X=75;  mechant3Y=300; mechant4X=75;  mechant4Y=150; mechant5X=375;  mechant5Y=450; m=0;}
if(m==4 && terrain==2) {marcheA1=0; marcheA2=0; marcheA3=0; marcheA4=0; mechant=loadImage("vide.png"); mechant2X=150; mechant2Y=675; mechantX=0; mechantY=0; mechant3X=75;  mechant3Y=300; mechant4X=75;  mechant4Y=150; mechant5X=375;  mechant5Y=450; marche=0; m=0;}
if(m==3 && terrain==3) { mechantX=525; mechantY=600;  mechant2X=0;  mechant2Y=0;  mechant3X=0;  mechant3Y=0; mechant4X=0;  mechant4Y=0; mechant5X=0;  mechant5Y=0; m=0;}
if(m==5 && terrain==4) { mechantX=0; mechantY=0;  mechant2X=0;  mechant2Y=0;  mechant3X=0;  mechant3Y=0; mechant4X=0;  mechant4Y=0; mechant5X=0;  mechant5Y=0; m=0;}
if(m==5 && terrain==5) { mechantX=0; mechantY=0;  mechant2X=0;  mechant2Y=0;  mechant3X=0;  mechant3Y=0; mechant4X=0;  mechant4Y=0; mechant5X=0;  mechant5Y=0; m=0;}
if(m==6 && terrain==6) { mechantX=0; mechantY=0;  mechant2X=0;  mechant2Y=0;  mechant3X=0;  mechant3Y=0; mechant4X=0;  mechant4Y=0; mechant5X=0;  mechant5Y=0; m=0;}
if(m==5 && terrain==7) { mechantX=0; mechantY=0;  mechant2X=0;  mechant2Y=0;  mechant3X=0;  mechant3Y=0; mechant4X=0;  mechant4Y=0; mechant5X=0;  mechant5Y=0; m=0;}
if(m==5 && terrain==5) { mechantX=0; mechantY=0;  mechant2X=0;  mechant2Y=0;  mechant3X=0;  mechant3Y=0; mechant4X=0;  mechant4Y=0; mechant5X=0;  mechant5Y=0; m=0;}
if(m==7 && terrain==8) { mechantX=75; mechantY=750;  mechant2X=750;  mechant2Y=750;  mechant3X=75;  mechant3Y=75; mechant4X=750;  mechant4Y=75; mechant5X=0;  mechant5Y=0; m=0;}}
 
 
void  yeti() {
 
image(yeti,yetiX,yetiY-75);
int dir=int(random(1,5));
if(yetiY==persoY && yetiX<persoX) {vu=1;} else {
if(yetiY==persoY && yetiX>persoX) {vu=2;} else {
if(yetiX==persoX && yetiY<persoY) {vu=3;} else {
if(yetiX==persoX && yetiY>persoY) {vu=4;} else {vu=0;}}}}
if(vu==0) {
if(dir==1 && frameCount%4==0 && yetiX<750 && collyetiG==0){ yetiX=yetiX+75; yeti=loadImage("yetiD.png");}
if(dir==2 && frameCount%4==0 && yetiX>75  && collyetiD==0){ yetiX=yetiX-75;yeti=loadImage("yetiG.png");}
if(dir==3 && frameCount%4==0  && yetiY<750  && collyetiH==0){ yetiY=yetiY+75; yeti=loadImage("yeti.png");}
if(dir==4 && frameCount%4==0 && yetiY>75  && collyetiB==0 ){ yetiY=yetiY-75; yeti=loadImage("yetiH.png");} }
 
if(vu==1 && yetiX<750 && frameCount%frame==0  && collyetiG==0) {yetiX=yetiX+75;yeti=loadImage("yetiD.png");}
if(vu==2 && yetiX>75 && frameCount%frame==0  && collyetiD==0) {yetiX=yetiX-75;yeti=loadImage("yetiG.png");}
if(vu==3 && yetiX<750 && frameCount%frame==0  && collyetiH==0) {yetiY=yetiY+75;yeti=loadImage("yeti.png");}
if(vu==4 && yetiX>75 && frameCount%frame==0  && collyetiB==0) {yetiY=yetiY-75;yeti=loadImage("yetiH.png");}
 
 if(yetiX==375 && yetiY==750 || yetiX==450 && yetiY==750){collyetiH=0;} else {
if(yetiX==225 && yetiY==525) {collyetiH=1;} else {
if(yetiX==150 && yetiY==450) {collyetiH=1;} else {
if(yetiX==300 && yetiY==225) {collyetiH=1;} else {
if(yetiX==150 && yetiY==75) {collyetiH=1;} else {
if(yetiX==675 && yetiY==75) {collyetiH=1;} else {
if(yetiX==600 && yetiY==225) {collyetiH=1;} else {
if(yetiX==525 && yetiY==450) {collyetiH=1;} else {
if(yetiX==675 && yetiY==600) {collyetiH=1;} else {
if(yetiX==450 && yetiY==600) {collyetiH=1;} else {
collyetiH=0;}}}}}}}}}}
    
if(yetiX==225 && yetiY==675) {collyetiB=1;} else {
if(yetiX==150 && yetiY==600) {collyetiB=1;} else {
if(yetiX==300 && yetiY==375) {collyetiB=1;} else {
if(yetiX==150 && yetiY==225) {collyetiB=1;} else {
if(yetiX==450 && yetiY==150) {collyetiB=1;} else {
if(yetiX==675 && yetiY==225) {collyetiB=1;} else {
if(yetiX==600 && yetiY==375) {collyetiB=1;} else {
if(yetiX==525 && yetiY==600) {collyetiB=1;} else {
if(yetiX==675 && yetiY==750) {collyetiB=1;} else {
if(yetiX==450 && yetiY==750) {collyetiB=1;} else {
{collyetiB=0;}}}}}}}}}}}
 
if(yetiX==75) { collyetiD=1;} else {
if(yetiX==300 && yetiY==600) {collyetiD=1;} else {
if(yetiX==225 && yetiY==525) {collyetiD=1;} else {
if(yetiX==375 && yetiY==300) {collyetiD=1;} else {
if(yetiX==225 && yetiY==150) {collyetiD=1;} else {
if(yetiX==525 && yetiY==75) {collyetiD=1;} else {
if(yetiX==750 && yetiY==150) {collyetiD=1;} else {
if(yetiX==675 && yetiY==300) {collyetiD=1;} else {
if(yetiX==600 && yetiY==525) {collyetiD=1;} else {
if(yetiX==750 && yetiY==675) {collyetiD=1;} else {
if(yetiX==525 && yetiY==675) {collyetiD=1;} else {
collyetiD=0;}}}}}}}}}}}
 
if(yetiX==750) { collyetiG=1;} else {
if(yetiX==150 && yetiY==600) {collyetiG=1;} else {
if(yetiX==75 && yetiY==525) {collyetiG=1;} else {
if(yetiX==225 && yetiY==300) {collyetiG=1;} else {
if(yetiX==75 && yetiY==150) {collyetiG=1;} else {
if(yetiX==375 && yetiY==75) {collyetiG=1;} else {
if(yetiX==600 && yetiY==150) {collyetiG=1;} else {
if(yetiX==525 && yetiY==300) {collyetiG=1;} else {
if(yetiX==450 && yetiY==525) {collyetiG=1;} else {
if(yetiX==600 && yetiY==675) {collyetiG=1;} else {
if(yetiX==375 && yetiY==675) {collyetiG=1;} else {
collyetiG=0;}}}}}}}}}}}
}
 
void music() { if(SONG==2){song.pause(); song3.pause(); song5.pause(); song4.pause(); song2.play(); song2.loop(); SONG=0;}
 if(SONG==3){song2.pause(); song4.pause(); song3.play(); song3.loop(); SONG=0;}
 if(SONG==4){song2.pause();song6.pause(); song7.pause(); song8.pause(); song3.pause(); song5.pause(); song4.play(); song4.loop(); SONG=0;}
 if(SONG==5){song2.pause(); song4.pause(); song7.pause(); song5.play(); song6.pause(); song5.loop(); SONG=0;}
 if(SONG==6){song5.pause(); song4.pause(); song7.pause(); song6.play(); song6.loop(); SONG=0;}
  if(SONG==7){song6.pause(); song4.pause(); song8.pause(); song7.play(); song7.loop(); SONG=0;}
  if(SONG==8){song7.pause(); song4.pause(); song8.play(); song8.loop(); SONG=0;}
}