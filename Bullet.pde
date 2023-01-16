class Bullet {
    int x, y;
    boolean canShoot = true;
    int shootdelay = 0;
    Bullet(int xpos, int ypos) {
        x = xpos + gridsize/2 - 4;
        y = ypos;
    }

    void draw() {
        fill(255,255,204);
        rect(x, y, pixelsize, pixelsize);
        y -= pixelsize * 2;
    }
}
