class TipsController < ApplicationController
  def index
    @q = Tip.ransack(params[:q])
    # @tips = @q.result(:distinct => true).includes().page(params[:page]).per(10)
    # threw error on .includes()
    @tips = @q.result(:distinct => true).page(params[:page]).per(10)

    render("tips/index.html.erb")
  end

  def show
    @tip = Tip.find(params[:id])

    render("tips/show.html.erb")
  end

  def new
    @tip = Tip.new

    render("tips/new.html.erb")
  end

  def create
    @tip = Tip.new

    @tip.tips_summary = params[:tips_summary]
    @tip.min_age = params[:min_age]
    @tip.max_age = params[:max_age]

    save_status = @tip.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tips/new", "/create_tip"
        redirect_to("/tips")
      else
        redirect_back(:fallback_location => "/", :notice => "Tip created successfully.")
      end
    else
      render("tips/new.html.erb")
    end
  end

  def edit
    @tip = Tip.find(params[:id])

    render("tips/edit.html.erb")
  end

  def update
    @tip = Tip.find(params[:id])

    @tip.tips_summary = params[:tips_summary]
    @tip.min_age = params[:min_age]
    @tip.max_age = params[:max_age]

    save_status = @tip.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tips/#{@tip.id}/edit", "/update_tip"
        redirect_to("/tips/#{@tip.id}", :notice => "Tip updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tip updated successfully.")
      end
    else
      render("tips/edit.html.erb")
    end
  end

  def destroy
    @tip = Tip.find(params[:id])

    @tip.destroy

    if URI(request.referer).path == "/tips/#{@tip.id}"
      redirect_to("/", :notice => "Tip deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tip deleted.")
    end
  end
end
