json.array!(@payperiods) do |payperiod|
  json.extract! payperiod, :id, :start, :end
  json.url payperiod_url(payperiod, format: :json)
end
