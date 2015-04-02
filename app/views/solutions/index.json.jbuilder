json.array!(@solutions) do |solution|
  json.extract! solution, :id, :title, :description, :votes, :admin_approval
  json.url solution_url(solution, format: :json)
end
