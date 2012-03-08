class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :fetch_projects_for_sidebar

  def fetch_projects_for_sidebar
    @projects = Project.all
  end
end
