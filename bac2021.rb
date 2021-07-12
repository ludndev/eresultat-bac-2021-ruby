require 'json'
require "uri"
require "net/http"

# @author : ludndev


num_examen = "31" # ne pas toucher

number_bac = "xxxxxxxxxxxxx"


puts 
puts "+ ---------------------------------- +"
puts 
puts "NUMERO   : #{number_bac}"
puts 
puts "+ ---------------------------------- +"


url = URI("https://api.eresultats.bj/api/candidates/search/#{num_examen}/session/#{number_bac}")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6ImRlNTE0ZjE3LWQ3OTEtNDhmYi04ZTliLTM5YjhkYTdjMDQ0YyJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVyZXN1bHRhdHMuYmoiLCJhdWQiOiJwcHJvZF9mcm9udGVuZF9hcHAiLCJqdGkiOiJkZTUxNGYxNy1kNzkxLTQ4ZmItOGU5Yi0zOWI4ZGE3YzA0NGMiLCJpYXQiOjE2MDE2NDYzOTcsIm5iZiI6MTYwMTY0NjQ1NywiZXhwIjoxNjMzMTgyMzk3LCJ1aWQiOiIzY2Q2ZmZiYi02MzRjLTRkZGQtOTM3MS1mZWEzYWQwZTM5ZWEifQ.D8Rmlh5hk1e_YL5KpPF2Q0xDLcvIyKFera8o9bG6V-o"

response = https.request(request)

j = JSON.parse(response.read_body)


puts 

if (response.kind_of? Net::HTTPSuccess)
  puts "CANDIDAT : #{j["lastname"]} #{j["firstname"]}"
  puts 
  puts "VERDICT  : #{j["verdict"]}"
else
  puts "ERREUR   : RESULTAT INDISPONIBLE"
end

puts 
puts "+ ---------------------------------- +"
puts



