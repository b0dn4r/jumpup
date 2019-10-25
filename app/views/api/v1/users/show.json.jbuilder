json.success true
json.user do
  json.id @user.id
  json.email @user.email
  json.pass @user.encrypted_password

  json.comments @user.comments do |c|
    json.id c.id
    json.body c.body
  end
end if @user.present?