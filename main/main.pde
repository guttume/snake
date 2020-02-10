Snake snake;
Food food;

PFont font;
int score;

int scale = 20;
int cols;
int rows;

String state = "stopped";


void setup() {
  size(800, 600);
  surface.setTitle("Snake");
  frameRate(4);
  cols = width/scale;
  rows = height/scale;

  snake = new Snake();
  food = new Food();

  font = createFont("Sriracha-Regular.ttf", 32);
}

void draw() {
  background(51);

  if (state == "playing") {

    if (snake.eats(food)) {
      incrementScore();
      food.pickLocation();
    }    

    if (snake.dead() || snake.hitWall()) {
      state = "stopped";
      snake = new Snake();
      food = new Food();
    }

    snake.update();
  }

  if (state != "paused") {
    food.display();
    snake.display();
  }

  textAlign(RIGHT);
  textFont(font);
  text("Score: " + score, 780, 50);

  if (state == "stopped" || state == "paused") {
    textAlign(CENTER);
    textSize(52);
    text("press SPACE to start", width/2, height/2);
  }
}

void keyPressed() {
  if (keyCode == DOWN && snake.velocity.y == 0) {
    snake.velocity.x = 0;
    snake.velocity.y = 1;
  } else if (keyCode == UP && snake.velocity.y == 0) {
    snake.velocity.x = 0;
    snake.velocity.y = -1;
  } else if (keyCode == LEFT && snake.velocity.x == 0) {
    snake.velocity.x = -1;
    snake.velocity.y = 0;
  } else if (keyCode == RIGHT && snake.velocity.x == 0) {
    snake.velocity.x = 1;
    snake.velocity.y = 0;
  }

  if (key == ' ') {
    if (state == "stopped") {
      state = "playing";
    } else if (state == "playing") {
      state = "paused";
    } else if (state == "paused") {
      state = "playing";
    }
  }
}

void incrementScore() {
  score++;
}
