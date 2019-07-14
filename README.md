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



```

```
```


