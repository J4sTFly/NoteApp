json.user do
  json.id @user.id
  json.email @user.email
  json.email_confirmed @user.email_confirmed
end
