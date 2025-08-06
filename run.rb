arg = ARGV[0]

require 'dotenv'
Dotenv.load(File.expand_path('.env', __dir__))

if arg == 'handlebars'
  require_relative 'handlebars'

  template = HandlebarsContext.compile("Your {{localize_category}} is complete")
  result = template.call({})

  puts 'result: ' + result
elsif arg == 'phobos'
  require_relative 'app/producers/subscribe_producer_phobos'
  Phobos.configure('config/phobos.yml')
  producer = SubscribeProducerPhobos.new

  times = if ARGV[1]
    ARGV[1].to_i
  else
    10
  end

  times.times do
    puts 'Phobos - publishing to topic: subscribe'
    producer.producer.publish(topic: 'subscribe', payload: 'test')
  end
elsif arg == 'karafka'
  require 'karafka'
  require_relative 'karafka'

  times = if ARGV[1]
    ARGV[1].to_i
  else
    10
  end

  times.times do
    puts 'Karafka - publishing to topic: subscribe'
    Karafka.producer.produce_sync(topic: 'subscribe', payload: { 'ping' => 'pong' }.to_json)
  end
end