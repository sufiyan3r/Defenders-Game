class Player extends SpaceShip {
    boolean canShoot = true;
    int shootdelay = 0;

    Player() {
        x = width/gridsize/2;
        y = height - (10 * pixelsize);
        sprite    = new String[5];
        sprite[0] = "0010100";
        sprite[1] = "0110110";
        sprite[2] = "1111111";
        sprite[3] = "1111111";
        sprite[4] = "0111110";
    }

//control keys to play
    void updateObj() {
        if (keyPressed && keyCode == LEFT) {
            x -= 5;
        }
        if (keyPressed && keyCode == RIGHT) {
            x += 5;
        }
        if (keyPressed && keyCode == UP) {
            y -= 5;
        }
        if (keyPressed && keyCode == DOWN) {
            y += 5;
        }
        if (keyPressed && keyCode == SHIFT && canShoot) {
            bullets.add(new Bullet(x, y));
            canShoot = false;
            shootdelay = 0;
        }

//shoot delay (bullet speed)
        shootdelay++;
        if (shootdelay >= 5) {
            canShoot = true;
        }
    }
}
