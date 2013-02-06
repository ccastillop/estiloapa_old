config = {
  #:class          => 'pagination',
  :previous_label => '&laquo; Anterior',
  :next_label     => 'Siguiente &raquo;',
  :inner_window   => 2, # links around the current page
  :outer_window   => 0, # links around beginning and end
  :separator      => ' ', # single space is friendly to spiders and non-graphic browsers
  #:param_name     => :page,
  #:params         => nil,
  #:renderer       => 'WillPaginate::LinkRenderer',
  :page_links     => true,
  :container      => true
}

config.each do |key, value|
  WillPaginate::ViewHelpers.pagination_options[key] = value
end