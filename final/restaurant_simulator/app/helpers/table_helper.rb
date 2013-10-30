module TableHelper
  
  def draw_table(haml, x, y)
  	
    Haml::Engine.new(haml).render
  end
    
end