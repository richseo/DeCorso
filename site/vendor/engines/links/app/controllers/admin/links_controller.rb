module Admin
  class LinksController < Admin::BaseController

    crudify :link, :xhr_paging => true

  end
end
