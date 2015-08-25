require 'sinatra'
require "./credit"


set :views, "views"



#вхідні
get '/' do
	erb :calc_form
end



#видача результатів
post '/result' do

	erb :result_form, :locals => {:params => request.POST} #?
	end


