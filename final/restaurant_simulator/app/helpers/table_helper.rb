module TableHelper
  
  def draw_table(haml)
  	#haml = haml{, :transform => translate(x, y) }
    Haml::Engine.new(haml).render
  end
end