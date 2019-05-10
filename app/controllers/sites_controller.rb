class SitesController < ApplicationController

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.save

    redirect_to sites_path
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)

    redirect_to site_path(@site)
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    redirect_to sites_path
  end
end

private

def site_params
  params.require(:site).permit(:name, :address)
end
