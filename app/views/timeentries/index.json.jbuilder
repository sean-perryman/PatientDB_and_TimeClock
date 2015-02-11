json.array!(@timeentries) do |timeentry|
  json.extract! timeentry, :id
  json.url timeentry_url(timeentry, format: :json)
end
