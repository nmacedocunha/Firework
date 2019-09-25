ProjectileManager pManager;

void setup()
{
  size(800, 400);
  pManager = new ProjectileManager();

  background(0);
}

void draw()
{
  // Desenha o rasto do objeto
  pushStyle();
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  popStyle();

  // Outra forma de limpar o background seria apenas usar
  // background(0);

  // Funcao para gerar os projeteis
  GenerateProjectile();

  // Update dos projeteis
  pManager.Update();

  // Desenhar os projeteis
  pManager.Draw();
}

// Funcao que vai chamar a funcao do projectil manager para lançar um novo projetil
void GenerateProjectile()
{
  // Aqui é enviado as coordenadas iniciais | Velocidade inicial | É atribuida uma cor aleatoria a cada projetil
  pManager.Launch(new PVector(random(20, width - 20), height - 20), new PVector(0, random(-250, -100)), color(random(100, 255), random(100, 255), random(100, 255)));
}
