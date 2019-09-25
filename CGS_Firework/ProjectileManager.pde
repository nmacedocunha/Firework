class ProjectileManager
{

  // Variavel do Particle Manager para controlar as particulas
  private ParticleManager particuleManager;

  // Lista dos projeteis em memoria
  private ArrayList<Projectile> projectiles;

  // Construtor
  public ProjectileManager()
  {
    // Variavel que vai controlar todas as particulas
    particuleManager = new ParticleManager();

    // Cria uma nova lista de Projectiles
    projectiles = new ArrayList<Projectile>();
  }

  // Lança um novo projetil
  public void Launch(PVector position, PVector velocity, color c)
  {    
    // Condicção que impede varios projeteis em cena ao mesmo tempo, espera que o projetil morra para lançar outro
    if (projectiles.size() < 1)
    {
      // Cria o novo projetil
      Projectile projectile = new Projectile(position, velocity, c);
      // Adiciona a lista o projetil
      projectiles.add(projectile);
    }
  }

  // Vai fazer update nas caracterstisticas do update do projetil
  public void Update()
  {
    // Percorremos um ciclo para confirmar que nenhum projetil escapa
    for (int i = 0; i < projectiles.size(); i++)
    {
      // Vai buscar o projetil a lista
      Projectile projectile = projectiles.get(i);
      // Faz update dos valores do projetil
      projectile.Update();

      // Se aquele projetil ja atingiu a altura maxima vai explodir
      if (projectile.exploded) 
      {
        // Ao explodir geram particulas para simular um fogo de artificio | Random define um numero de particulas a gerar | Passa o projetil para poder aceder
        // as suas propriedades cor e position para as particulas.
        particuleManager.GenerateParticles((int)random(10, 30), projectile);

        // Remove o projetil que explodiu da lista
        projectiles.remove(i);
      }
    }

    // Quando faz os updates das projectiles faz o update das particulas ao mesmo tempo
    particuleManager.Update();
  }

  // Desenha os projeteis
  public void Draw()
  {
    // Ciclo para percorrer os projeteis e desenhar
    for (int i = 0; i < projectiles.size(); i++)
    {
      Projectile projectile = projectiles.get(i);
      projectile.Draw();
    }

    // Desenha as particulas
    particuleManager.Draw();
  }
}
