class BabiesController < ApplicationController
  before_action :current_user_must_be_baby_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_baby_user
    baby = Baby.find(params[:id])

    unless current_user == baby.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.babies.ransack(params[:q])
      @babies = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("babies/index.html.erb")
  end

  def show
    @baby = Baby.find(params[:id])

    render("babies/show.html.erb")
  end

  def new
    @baby = Baby.new

    render("babies/new.html.erb")
  end

  def create
    @baby = Baby.new

    @baby.name = params[:name]
    @baby.birthdate = params[:birthdate]
    @baby.user_id = params[:user_id]

    save_status = @baby.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/babies/new", "/create_baby"
        redirect_to("/babies")
      else
        redirect_back(:fallback_location => "/", :notice => "Baby created successfully.")
      end
    else
      render("babies/new.html.erb")
    end
  end

  def edit
    @baby = Baby.find(params[:id])

    render("babies/edit.html.erb")
  end

  def update
    @baby = Baby.find(params[:id])

    @baby.name = params[:name]
    @baby.birthdate = params[:birthdate]
    @baby.user_id = params[:user_id]

    save_status = @baby.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/babies/#{@baby.id}/edit", "/update_baby"
        redirect_to("/babies/#{@baby.id}", :notice => "Baby updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Baby updated successfully.")
      end
    else
      render("babies/edit.html.erb")
    end
  end

  def destroy
    @baby = Baby.find(params[:id])

    @baby.destroy

    if URI(request.referer).path == "/babies/#{@baby.id}"
      redirect_to("/", :notice => "Baby deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Baby deleted.")
    end
  end
end
