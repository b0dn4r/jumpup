json.success true
json.comments @comments do |comment|
  json.id comment.id
  json.user_name comment.user_name
  json.body comment.body
end