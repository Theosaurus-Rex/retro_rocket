class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all.reverse
  end

  # Search Listings Table using parameters from Search Bar
  def search  
    if params[:search].blank?  
      redirect_to(listings_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Listing.all.where("lower(listing_title) LIKE :search", search: "%#{@parameter}%")
    end  
  end

  # GET /listings/1 or /listings/1.json
  def show
    if user_signed_in?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
          name: @listing.listing_title,
          description: @listing.listing_description,
          amount: @listing.price.to_i * 100,
          currency: 'aud',
          quantity: 1
        }],
        payment_intent_data: {
          metadata: {
            user_id: current_user.id,
            listing_id: @listing.id
          }
        },
        success_url: "#{root_url}payments/success?listing_id=#{@listing.id}", 
        cancel_url: "#{root_url}listings"
      )
    
    @session_id = session.id
  end
  end

  

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.photo.attach(params[:listing][:photo])
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:listing_title, :listing_description, :user_id, :price, :condition, :category_id, :photo)
    end
end
