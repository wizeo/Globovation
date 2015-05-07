class SitemapsController < ApplicationController
  def show
    @projects = Project.where(:active => true) #we are generating url's for posts
    respond_to do |format|
     format.xml
    end
  end
end