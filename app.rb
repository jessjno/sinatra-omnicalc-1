require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end


get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  
  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  
  @the_result = Math.sqrt(@the_num)

  erb(:square_root_result)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @rate = ((params.fetch("annual_percentage_rate").to_f / 100) / 12)
  @number_of_years_remaining= params.fetch("number_of_periods_remaining").to_i * 12
  @present_value = params.fetch("principal").to_f  
  
  @numerator = rate * present_value
  @denominator = (1 - (1 + rate) ** number_of_years_remaining)

  @the_result = @numerator / @denominator

  erb(:payment_result)
end

get("/random/new") do
  erb(:random_nums)
end

get("/random/results") do
  @the_min = params.fetch("first_number").to_i
  
  @the_max = params.fetch("second_number").to_i

  @the_result = rand(@the_min..@the_max)

  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
