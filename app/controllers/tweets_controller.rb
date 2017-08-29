class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.json
  def index
    if params[:user_id]
      @tweets = Tweet.recent.includes(:location).where(User_id: params[:ser_id])
    else
      @tweets = Tweet.recent.includes(:location)
    end
    @about_tweets = Tweet.recent.about

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
    end
  end

  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @tweet = Tweet.new
    @tweet.location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @user = User.find(params[:user_id])
    location = params[:tweet].delete :location
    @tweet = @user.tweets.new(params[:tweet])
    @tweet.build_location(location)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])
    binding.pry
    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :ok }
    end
  end
end
