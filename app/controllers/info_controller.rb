class InfoController < ApplicationController
require 'rubygemsorg'

  def infogem
  	if params[:search_gem].to_s.present?
name = params[:search_gem]
response = RubyGemsOrg.getGemInfo(name)
name = response['name']
@dependency = Dependency.find_by(:name => name)
if @dependency.blank?
@dependency = Dependency.create(:name=>response['name'],
:authors=>response['authors'],:version=>response['version'])
end
else
redirect_to(root_url)
end
end

  

  def infoauthor
  	if params[:search_author].to_s.present?
@author= params[:search_author]
@response = RubyGemsOrg.getGemsOfAuthor(@author)
else
redirect_to(root_url)
end
end


  def infolatestgems
  end
end
