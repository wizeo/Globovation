class SitemapController < ApplicationController
   def index
     @static_pages = [root_path, about_path]
     @projects = Project.all
     respond_to do |format|
       format.xml
     end
   end
 end