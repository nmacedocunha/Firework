class ParticleManager
{
  // Lista dos particulas em memoria
  private ArrayList<Particle> particles;

  // Constructor
  public ParticleManager()
  {
    // Cria uma nova lista de particulas
    particles = new ArrayList<Particle>();
  }

  // Adiciona a particula a lista
  public void addParticle(PVector position, PVector velocity, color c)
  {    
    // Instancia a particula e adiciona
    Particle particle = new Particle(position, velocity, c);
    particles.add(particle);
  }

  // Vai fazer update nas caracterstisticas do update das particulas
  public void Update()
  {
    for (int i = 0; i < particles.size(); i++)
    {
      Particle particle = particles.get(i);
      particle.Update();

      // Se a particula ja tiver ultrapassado os limites remove da memoria
      if (particle.GetPosition().x > width || particle.GetPosition().x < 0 || particle.GetPosition().y > height)
        particles.remove(i);
    }
  }

  // Desenha as particulas
  public void Draw()
  {
    for (int i = 0; i < particles.size(); i++)
    {
      Particle particle = particles.get(i);
      particle.Draw();
    }
  }

  // Gera as particulas
  public void GenerateParticles(int nParticules, Projectile projectile)
  {
    for (int i = 0; i < nParticules; i++)
    {
      // Adiciona nParticulas a lista.
      addParticle(new PVector(projectile.position.x, projectile.position.y), new PVector(random(-150, 150), random(-150, 40)), projectile.GetColor());
    }
  }
}
