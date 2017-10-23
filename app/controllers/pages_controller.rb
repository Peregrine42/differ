class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find_by(title: params[:title])
  end

  def update
    @page = Page.find_by(title: params[:title]) || Page.new(title: params[:title])
    @page.content = params[:page][:content]
    if @page.content.blank?
      @page.destroy
      return redirect_to title_path_to(@page)
    end
    if @page.save
      redirect_to title_path_to(@page)
    else
      render :edit
    end
  end

  def edit
    @page = Page.find_by(title: params[:title]) || Page.new(title: params[:title])
  end

  def title_path_to page
    "/pages/#{page.title}"
  end
end
