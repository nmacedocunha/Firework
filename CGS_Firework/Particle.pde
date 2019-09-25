class Particle 
{
  private PVector gravity;
  private PVector position;
  private PVector velocity;

  private float mass = 0.1f;
  private float size;
  private float alphaValue;
  private float timeForLastFrame;

  private color col;

  // Constructor
  public Particle(PVector position, PVector velocity, color c)
  {
    this.position = position;
    this.velocity = velocity;
    this.size = 2;
    this.col = c;

    gravity = new PVector(0, 10);

    alphaValue = alpha(col);  
    timeForLastFrame = millis();
  }

  // Update dos valores da particula
  public void Update()
  {
    // Tempo que demorou a desenhar a ultima frame
    float deltaTime = (millis() - timeForLastFrame) / 1000;

    // Ve para que a direcao da particula vai e aplica a força oposta
    if (velocity.x > 0)
      gravity.x = -10;
    else
      gravity.x = 10;

    // Atualiza as velocidades
    this.velocity.x += gravity.x /mass * deltaTime;
    this.velocity.y += gravity.y / mass * deltaTime;

    // Atualiza as posicoes
    this.position.x += this.velocity.x * deltaTime;
    this.position.y += this.velocity.y * deltaTime;

    timeForLastFrame = millis();
  }

  // Desenha a particula
  public void Draw()
  {
    pushMatrix();
    noStroke();
    fill(col);
    alphaValue -= 2;
    // Va 
    fill(red(col), green(col), blue(col), alphaValue);
    ellipse(position.x, position.y, size, size);
    popMatrix();
  }

  // Retorna a posicao atual da particle
  public PVector GetPosition()
  {
    return position;
  }
}
