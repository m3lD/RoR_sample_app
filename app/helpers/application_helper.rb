module ApplicationHelper
  
  # Devuelve el título completo en caso de que no este seteado.
  def full_title(page_title = '')
    base_title = "Tweety App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
    
end