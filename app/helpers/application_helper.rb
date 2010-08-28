module ApplicationHelper
  
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
  
  def title
    base_title = "Geoaccess prototype"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end