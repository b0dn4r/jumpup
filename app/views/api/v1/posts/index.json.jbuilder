json.success true
json.posts @posts do |post|
  json.id post.id
  json.name post.name

  json.comments post.comments do |c|
    json.id c.id
    json.body c.body
  end
end if @posts.present?