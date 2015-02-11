class SearchController < ApplicationController
	def search
	  if params[:q].nil?
	    @patients = []
	  else
	    @patients = Patient.search params[:q], size: 250
	  end
	end
end
