class BlogPagesController < ApplicationController

  def show
    @blog_page = BlogPage.find(params[:id])
    if @blog_page.templateable_type
      render @blog_page.templateable_type.to_s.underscore
    end
  end

end