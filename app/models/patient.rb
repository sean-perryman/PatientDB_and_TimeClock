class Patient < ActiveRecord::Base

	def full_name
    first_name + " " + last_name
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Patient.import