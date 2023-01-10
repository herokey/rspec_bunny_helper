# frozen_string_literal: true

module RspecBunnyHelper
  class << self
    def channel
      @channel ||= Channel.new
    end

    def reset_channel
      @channel&.clear_exchanges
      @channel&.clear_queues
    end
  end

  class Channel
    def initialize
      @exchanges = []
      @queues = []
    end

    def fanout(exchange_name, _options = {})
      find_or_create_exchange(exchange_name, type: 'fanout')
    end

    def default_exchange(_options = {})
      find_or_create_exchange('default_exchange', type: 'default')
    end

    def queue(name, options = {})
      queue = @queues.find { |item| item.name == name }

      queue || create_queue(name, options)
    end

    def clear_exchanges
      @exchanges = []
    end

    def clear_queues
      @queues = []
    end

    private

    def find_or_create_exchange(name, type)
      exchange = @exchanges.find { |item| item.name == name }

      exchange || create_exchange(name, type)
    end

    def create_queue(name, options)
      queue = Queue.new(name, options)
      register_queue(queue)

      queue
    end

    def create_exchange(name, type)
      exchange = Exchange.new(name, type)
      register_exchange(exchange)

      exchange
    end

    def register_queue(queue)
      @queues << queue
    end

    def register_exchange(exchange)
      @exchanges << exchange
    end
  end

  class Queue
    attr_reader :name

    def initialize(name, _options = {})
      @name = name
    end
  end

  class Exchange
    attr_reader :name

    def initialize(name, type, _options = {})
      @name = name
      @type = type
      @messages = []
    end

    def publish(json_data, options = {})
      @messages << { json_data: json_data, options: options }
    end
  end
end
