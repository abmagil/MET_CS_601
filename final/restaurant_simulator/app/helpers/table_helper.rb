module TableHelper
  
  def draw_table(haml)
    Haml::Engine.new(haml).render
  end
    
end