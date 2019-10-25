json.success true
json.post do
  json.id @post.id
  json.name @post.name

  json.comments @post.comments do |c|
    json.id c.id
    json.body c.body
  end

  json.post_images @post.post_images do |p_c|
    json.id p_c.id
    json.img p_c.img
  end
end if @post.present?