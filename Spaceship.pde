class SpaceShip {
    int x, y;
    String sprite[];
    color baseColor = color(255, 255, 255);
    color nextColor = baseColor;

    void draw() {
        updateObj();
        drawSprite(x, y);
    }

    void drawSprite(int xpos, int ypos) {
        fill(nextColor);
        
        nextColor = baseColor;
      
        for (int i = 0; i < sprite.length; i++) {
            String row = (String) sprite[i];

            for (int j = 0; j < row.length(); j++) {
                if (row.charAt(j) == '1') {
                    rect(xpos+(j * pixelsize), ypos+(i * pixelsize), pixelsize, pixelsize);
                }
            }
        }
    }

    void updateObj() {
    }
}
