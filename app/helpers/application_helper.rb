module ApplicationHelper
  
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
  
  def neighborhoods
    Neighborhood.all
  end
  
  def title
    base_title = "Geoaccess prototype"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def draw_map_of(address, options = {})
    use_google_maps_js
    lat, lng = address.latitude, address.longitude
    if lat.present? && lng.present?
      options[:class] = [options[:class].to_s.split(" "), "gmap"].join(" ").squeeze(" ")
      options["data-latitude"]  = lat
      options["data-longitude"] = lng
      marker_opts = options.delete(:marker) || {}
      marker_opts[:title] ||= address.name
      marker_opts.each_pair { |k, v| options["data-marker-#{k.to_s.gsub("_", "-")}"] = v }
      content_tag(:div, "&nbsp;", options)
    end
  end
  
  def use_google_maps_js(sensor = false)
    unless defined?(@gmaps_used) && @gmaps_used
      js = javascript_include_tag("http://maps.google.com/maps/api/js?sensor=#{sensor}", "gmap")
      content_for(:extra_head, js)
      @gmaps_used = true
    end
  end

end