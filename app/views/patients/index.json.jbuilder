json.array!(@patients) do |patient|
  json.extract! patient, :id, :patientID, :code, :first_name, :last_name, :address1, :address2, :city, :state, :zip, :phone1, :phone2, :sex, :birthdate, :ssn
  json.url patient_url(patient, format: :json)
end
