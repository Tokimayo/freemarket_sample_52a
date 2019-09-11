json.array! @children do |cateChild|
  json.id cateChild.id
  json.name cateChild.name
end

json.array! @size do |size|
  json.category_flag size.category_flag
  json.name size.name
end
