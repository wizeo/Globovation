class SitemapController < ApplicationController
   def index
     @static_pages = [root_url, about_url]
     @projects = Project.all
     respond_to do |format|
       format.xml
     end
   end
 end