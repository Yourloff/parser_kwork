require 'sidekiq'
require 'pry'

# настройки надо вынести в config

Sidekiq.configure_server do |config|
  config.redis = { db: 1 } # надо добавить ENV['REDIS_URL']
end

Sidekiq.configure_client do |config|
  config.redis = { db: 1 } # подумать
end

class ParserWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "sidekiq hello world"
    binding.pry
  end
end