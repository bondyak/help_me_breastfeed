class ResourcesController < ApplicationController
  def index
    @q = Resource.ransack(params[:q])
    @resources = @q.result(:distinct => true).includes(:issue).page(params[:page]).per(10)

    render("resources/index.html.erb")
  end

  def show
    @resource = Resource.find(params[:id])

    render("resources/show.html.erb")
  end

  def new
    @resource = Resource.new

    render("resources/new.html.erb")
  end

  def create
    @resource = Resource.new

    @resource.resource_summary = params[:resource_summary]
    @resource.issue_id = params[:issue_id]
    @resource.resource_url = params[:resource_url]

    save_status = @resource.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resources/new", "/create_resource"
        redirect_to("/resources")
      else
        redirect_back(:fallback_location => "/", :notice => "Resource created successfully.")
      end
    else
      render("resources/new.html.erb")
    end
  end

  def edit
    @resource = Resource.find(params[:id])

    render("resources/edit.html.erb")
  end

  def update
    @resource = Resource.find(params[:id])

    @resource.resource_summary = params[:resource_summary]
    @resource.issue_id = params[:issue_id]
    @resource.resource_url = params[:resource_url]

    save_status = @resource.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resources/#{@resource.id}/edit", "/update_resource"
        redirect_to("/resources/#{@resource.id}", :notice => "Resource updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Resource updated successfully.")
      end
    else
      render("resources/edit.html.erb")
    end
  end

  def destroy
    @resource = Resource.find(params[:id])

    @resource.destroy

    if URI(request.referer).path == "/resources/#{@resource.id}"
      redirect_to("/", :notice => "Resource deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Resource deleted.")
    end
  end
end
