json.success true
json.categories @categories do |cat|
  json.id cat.id
  json.name cat.name
  json.active cat.active
  json.img cat.img
  
end