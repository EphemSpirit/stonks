class Stock < ApplicationRecord

  def self.find_price(ticker)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex[:publishable_token],
                                  secret_token: Rails.application.credentials.iex[:secret_token],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    client.price(ticker)
  end

end
