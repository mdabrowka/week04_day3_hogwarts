require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/student.rb')


get '/welcome' do
  erb(:welcome)
end

get '/students' do
  @students = Student.all
  erb(:index)
end

# get '/name/:first/:last' do
#   return "Welcome to Hogwarts, #{params[:first].capitalize} #{params[:last].capitalize}!"
# # end

# get '/students/:number' do
#   students = ["Harry", "Draco", "Cedric", "Luna"]
#   index = params["number"].to_i - 1
#   return students[index]
# end
