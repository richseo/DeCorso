class StaffDirectoriesController < ApplicationController

  before_filter :find_all_staff_directories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @staff_directory in the line below:
    present(@page)
  end

  def show
    @staff_directory = StaffDirectory.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @staff_directory in the line below:
    present(@page)
  end

protected

  def find_all_staff_directories
    @staff_directories = StaffDirectory.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/staff_directories").first
  end

end
