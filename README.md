### bitcoin_payable
---
https://github.com/Sailias/bitcoin_payable

```sh
bundle
rails g bitcoin_payable:install --skip
bundle exec rake db:migrate
gem install bitcoin_payable
```

```rb
# config/initializers/bitcoin_payable.rb
BitcoinPayable.config do |config|
  
  config.currency = :usd
  
  config.node_path = "m/0/"
  config.master_public_key = "your xpub master public key here"
  
  config.testnet = true
  config.adapter = 'blocktrail'
  
  config.confirmations = 6
  
  #
  #
  #
  config.rate_calculation = :daily_average
  
  #
  config.allowwebhooks = true
  config.webhook_domain = "subdomain.domain.com:port"
end

ENV['BITCOIN_PAYABLE_WEBHOOK_USER']= "username"
ENV['BITCOIN_PAYABLE_WEBHOOK_PASS']= "password"

ENV['BLOCKTRAIL_API_KEY']= "key"
ENV['BLOCKTRAIL_API_SECRET']= "secret"

class Product < ActiveRecord::Base
  has_bitcoin_payments
end

def create_payment(amount_in_cents)
  self.bitcoin_payments.create!(reason: 'sale', price: amount_in_cents)
end

def Product < ActiveRecord::Base
  has_bitcoin_payments
  
  def create_payment(amount_in_cents)
    self.bitcoin_payment.create!(reason: 'sale', price: amount_in_cents)
  end
  
  def bitcoin_payment_paid
    self.ship!
  end
end


def bitcoin_payment_status_changed(from_state, to_state)
  if to_state == "confirmed"
    self.ship!
  elsif to_state == "paid_in_full"
    self.notify_payment_received(self)
  end
end

bitcoin_payment = @product.bitcoin_payments.first
bitcoin_payment.transactions.each do |transaction|
  puts transaction.block_hash
  puts transaction.block_time
  
  puts transaction.transaction_hash
  
  puts transaction.estimated_value
  puts transaction.estimated_time
  
  puts transaction.btc_conversion
end
```

```
```


