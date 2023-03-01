require_relative 'parser_response'

class Kwork
  attr_reader :status, :category, :attr, :data

  def initialize(**attrs)
    @category = attrs[:c]
    @attr = attrs[:attr]
    @data = ParserResponse.new(@category, @attr).response
  end

  def status
    @data['success']
  end

  def orders
    puts 'Данные отсутствуют' unless status

    array_orders = @data.dig('data', 'wants')

    return 'Заказы отсутствуют' if array_orders.empty?

    array_orders.map do |order|
      {
        name: order['name'],
        description: order['description'],
        url: order['url'],
        price: order['priceLimit']
      }
    end
  end
end
