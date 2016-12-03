class IssuesController < ApplicationController
  def index
    @q = Issue.ransack(params[:q])
    @issues = @q.result(:distinct => true).includes(:resources).page(params[:page]).per(10)

    render("issues/index.html.erb")
  end

  def show
    @resource = Resource.new
    @issue = Issue.find(params[:id])

    render("issues/show.html.erb")
  end

  def new
    @issue = Issue.new

    render("issues/new.html.erb")
  end

  def create
    @issue = Issue.new

    @issue.issue_summary = params[:issue_summary]
    @issue.min_age = params[:min_age]
    @issue.max_age = params[:max_age]

    save_status = @issue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/issues/new", "/create_issue"
        redirect_to("/issues")
      else
        redirect_back(:fallback_location => "/", :notice => "Issue created successfully.")
      end
    else
      render("issues/new.html.erb")
    end
  end

  def edit
    @issue = Issue.find(params[:id])

    render("issues/edit.html.erb")
  end

  def update
    @issue = Issue.find(params[:id])

    @issue.issue_summary = params[:issue_summary]
    @issue.min_age = params[:min_age]
    @issue.max_age = params[:max_age]

    save_status = @issue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/issues/#{@issue.id}/edit", "/update_issue"
        redirect_to("/issues/#{@issue.id}", :notice => "Issue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Issue updated successfully.")
      end
    else
      render("issues/edit.html.erb")
    end
  end

  def destroy
    @issue = Issue.find(params[:id])

    @issue.destroy

    if URI(request.referer).path == "/issues/#{@issue.id}"
      redirect_to("/", :notice => "Issue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Issue deleted.")
    end
  end
end
