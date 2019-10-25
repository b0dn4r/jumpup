json.success true
json.post_image do
  json.id @post_image.id
  json.img @post_image.img

  json.post_id @post_image.post.id
  json.post @post_image.post.name

end if @post_image.present?