json.success true
json.post_images @post_images do |p_c|
  json.id p_c.id
  json.img p_c.img
end