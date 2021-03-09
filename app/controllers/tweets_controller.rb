class TweetsController < ApplicationController
  # Helper: call the set_article before any action.
  before_action :set_article #, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def show

  end

  def new
    @tweet = Tweet.new
  end

  # GET /tweet/1/edit
  def edit
  end

  # POST /articles
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = "Tweet was created successfully."
      #redirect_to article_path(@article) # When you click on save
      redirect_to @tweet # short way with the same effect
    else
      render :new
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    if @tweet.update(tweet_params)
      flash[:notice] = "Tweet was updated successfully."
      redirect_to @tweet
    else
      render "edit"
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end






end
