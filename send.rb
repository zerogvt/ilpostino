#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new(hostname: 'localhost')
connection.start
channel = connection.create_channel
queue = channel.queue('hello')

channel.default_exchange.publish('Hello World', routing_key: queue.name)
puts " [x] Sent 'Hello Worlds!'"
connection.close

