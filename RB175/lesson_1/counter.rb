require 'socket'

def parse_request(request_line)
  http_method, path_and_params, http = request_line.split(" ")
  path, params = path_and_params.split("?")

  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line # output first line of the request to the console

  next unless request_line

  http_method, path, params = parse_request(request_line)

  # Required output for the browser to display response correctly
  client.puts "HTTP/1.1 200 OK" 
  client.puts "Content-Type: text/html"
  # client.puts "Content-Type: text/html\r\n\r\n"

  client.puts
  
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"
  
  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  
  client.puts "<p>The current number #{number}.</p> "

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Substract one</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end
