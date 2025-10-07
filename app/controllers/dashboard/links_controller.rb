class Dashboard::LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new
    if @link.save
      redirect_to landing_page_link_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    redirect_to landing_page_link_path
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to landing_page_link_path, notice: 'Link was removed.'
  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :position)
  end
end
