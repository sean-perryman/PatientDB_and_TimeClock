class SearchController < ApplicationController
	def search
	  if params[:q].present?
	    @search = Patient.search params[:q], size: 250
	  else
	    @search = []
	  end
	end
end
