json.success true
json.users @users do |user|
  json.id user.id
  json.email user.email
  json.pass user.encrypted_password
end