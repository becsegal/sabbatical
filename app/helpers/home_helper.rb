module HomeHelper
  def grid_span_style col_start, col_span, row_start, row_span
    "style='grid-column: #{col_start} / span #{col_span}; grid-row: #{row_start} / span #{row_span};'".html_safe
  end
end
