json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :main_img_url
  json.url project_url(project, format: :json)
end
