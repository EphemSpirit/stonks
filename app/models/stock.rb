class Stock < ApplicationRecord

  def self.find_price(ticker)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex[:publishable_token],
                                  secret_token: Rails.application.credentials.iex[:secret_token],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      new(ticker: ticker, name: client.company(ticker).company_name, last_price: client.price(ticker))
    rescue => exception
      return nil
    end
  end

end
