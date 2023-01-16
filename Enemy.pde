class Enemy extends SpaceShip {
    int life = 3; //after the number of hits specified the spaceship is destroyed
    
    Enemy(int xpos, int ypos) {
        x = xpos;
        y = ypos;
        sprite    = new String[5];
        sprite[0] = "1011101";
        sprite[1] = "0101010";
        sprite[2] = "1111111";
        sprite[3] = "0101010";
        sprite[4] = "1000001";
    }

    void updateObj() {
        if (frameCount%30 == 0) {
            x += direction * gridsize;
        }
        
        if (incy == true) {
            y += gridsize / 2;
        }
    }

    boolean alive() {
        for (int i = 0; i < bullets.size(); i++) {
            Bullet bullet = (Bullet) bullets.get(i);
            
            if (bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
                bullets.remove(i);
                
                life--;
                nextColor = color(255, 0, 0);
                
                if (life == 0) {
                    score += 50;
                    return false;
                }
                
                break;
            }
        }

        return true;
    }

    boolean outside() {
        return x + (direction*gridsize) < 0 || x + (direction*gridsize) > width - gridsize;
    }
}
