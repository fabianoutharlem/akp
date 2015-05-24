class PagesController < ApplicationController

  def show
    @page = Page.find(params[:id])
    add_breadcrumb @page.title
  end

  def contact
    add_breadcrumb 'Contact'
  end

  def sitemap
    add_breadcrumb 'Sitemap'
  end

end