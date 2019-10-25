json.success true
json.comment do
  json.id @comment.id
  json.body @comment.body

  json.user_id @comment.user.id
  json.user @comment.user.email

  json.post_id @comment.post.id
  json.post @comment.post.name

end if @comment.present?