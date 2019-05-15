class SitesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show]
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def index
    # @sites = Site.all
    @sites = policy_scope(Site)
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
    authorize @site
  end

  def create
    # @site = Site.new(site_params)
    @site = current_user.sites.build(site_params)
    authorize @site
    if @site.save
      redirect_to sites_path
    else
      render :new
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render :show
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    redirect_to sites_path
  end
end

private

def set_site
  @site = Site.find(params[:id])
  authorize @site
end

def site_params
  params.require(:site).permit(:name, :address, :articles, :photo)
end
