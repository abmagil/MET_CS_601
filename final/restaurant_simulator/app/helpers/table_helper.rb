module TableHelper
  
  def draw_table(haml, x, y)
  	haml = haml{, :transform => translate(x, y) }
    Haml::Engine.new(haml).render
  end
    
end