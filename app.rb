# app.rb
require 'rubygems'
require 'sinatra'
require './pdf-filler.rb'

#return a filled PDF as a result of post data
post '/fill' do
  pdf = Pdf_Filler.new
  pdf.fill( params['pdf'], params )
end

#return JSON list of field names
#e.g., /fields.json?pdf=http://help.adobe.com/en_US/Acrobat/9.0/Samples/interactiveform_enabled.pdf
get '/fields.json' do
  pdf = Pdf_Filler.new
  pdf.get_fields( params['pdf'] )
end