module Shu_paginate

attr_accessor :page, :per_page

  def paginate_shu(:page, :per_page)
    Resource.limit(:per_page).offset(:page * :per_page)
  end

end
