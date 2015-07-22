class BlogPagesController < ApplicationController

  def show
    @blog_page = BlogPage.find(params[:id])
    add_breadcrumb @blog_page.title
    if @blog_page.templateable_type
      render @blog_page.templateable_type.to_s.underscore
    end
  end

end