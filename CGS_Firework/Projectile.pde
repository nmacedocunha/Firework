class Projectile
{ 
  private PVector position;
  private PVector velocity;

  private float mass = 0.1f;
  private float gravity = 10f;
  private float size;
  private float timeForLastFrame;

  private color col;

  public boolean exploded;
  
  // Constructor
  public Projectile(PVector position, PVector velocity, color c)
  {
    this.position = position;
    this.velocity = velocity;
    this.size = 15;
    this.col = c;
    timeForLastFrame = millis();
  }

  // Update dos valores dos projectiles
  public void Update()
  {
    // Tempo que demorou a desenhar a ultima frame
    float deltaTime = (millis() - timeForLastFrame) / 1000;

    // Velocidade do projetil
    this.velocity.y += gravity / mass * deltaTime;

    // Se a velocidade for superior >= 0 significa que ele atingiu a altura maxima com base na velocidade inicial e começa a descer,
    // neste caso damos uma posicao inferior para nao esperar tanto ate que ele atingia a velocidade 0.
    if (this.velocity.y > - 60)
      exploded = true;
  
    // Atualiza as posicoes
    this.position.x += this.velocity.x * deltaTime;
    this.position.y += this.velocity.y * deltaTime;

    timeForLastFrame = millis();
  }

  // Desenha os projeteis
  public void Draw()
  {
    pushMatrix();
    noStroke();
    fill(col);
    rect(position.x, position.y, size/4, size);
    popMatrix();
  }

  // Retorna a posicao do projetil
  public PVector getPosition()
  {
    return position;
  }

  // Retorna a cor do projetil
  public color GetColor()
  {
    return col;
  }
}
