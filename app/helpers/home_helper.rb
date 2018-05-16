module HomeHelper

  def pixels_per_hour
    4
  end

  def grid_span_style row_start, row_span
    "style='top: #{row_start * pixels_per_hour}px; height: #{row_span * pixels_per_hour}px'".html_safe
  end
end
