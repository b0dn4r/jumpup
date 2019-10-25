json.success true
json.category do
  json.id @category.id
  json.name @category.name
  json.active @category.active
  json.img @category.img

  json.posts @category.posts do |p|
    json.id p.id
    json.name p.name
  end
end if @category.present?