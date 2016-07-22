class ListingsController < ApplicationController

  before_action :require_login, only: [:edit, :update, :new, :create]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def search
    @listings = Listing.where("location LIKE ?","#{params[:listing][:location]}%")
    res=[]
    arr = params[:listing][:tag_ids].map! {|t| t.to_i }
    tags = ActsAsTaggableOn::Tag.where(id:arr)
    @listings.each do |listing|
      if (tags-listing.tags).empty?
        res << listing
      end
    end

    render json: res
  end

  def index
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_path
  end


  def show
  end

  def listing_params
    params.require(:listing).permit(:title,:location,:price,:max_pax,:tag_list)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end