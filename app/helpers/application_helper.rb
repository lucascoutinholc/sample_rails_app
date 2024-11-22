module ApplicationHelper

  # Retorna o título completo de cada página.
  def full_title(page_title = '')
    base_title = 'Amostra App'
    if page_title.empty?
      base_title
    else
      "#{ page_title } | #{ base_title }"
    end
  end
end
