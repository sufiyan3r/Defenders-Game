int pixelsize = 3;
int gridsize  = pixelsize * 9 + 5;
Player player;
ArrayList enemies = new ArrayList();
ArrayList bullets = new ArrayList();
int direction = 1;
boolean incy = false;
int score = 0;
PFont f; //loads font
PImage bg; //load background image

void setup() {
    bg = loadImage("space-background.jpg");
    noStroke();
    size(1280,558);
    player = new Player();
    createEnemies();

    f = createFont("Arial", 36, true);
}

void draw() {
    background(bg);
    drawScore();
    player.draw();

    for (int i = 0; i < bullets.size(); i++) {
        Bullet bullet = (Bullet) bullets.get(i);
        bullet.draw();
    }
    for (int i = 0; i < enemies.size(); i++) {
        Enemy enemy = (Enemy) enemies.get(i);
        if (enemy.outside() == true) {
            direction *= (-1);
            incy = true;
            break;
        }
    }

    for (int i = 0; i < enemies.size(); i++) {
        Enemy enemy = (Enemy) enemies.get(i);
        if (!enemy.alive()) {
            enemies.remove(i);
        } else {
            enemy.draw();
        }
    }

    incy = false;
}

void drawScore() {
    textFont(f);
    text("Score: " + String.valueOf(score), 550, 50);
}

void createEnemies() {
    for (int i = 0; i < width/gridsize/2; i++) {
        for (int j = 0; j <= 5; j++) {
            enemies.add(new Enemy(i*gridsize, j*gridsize + 70));
        }
    }
}
