require 'rake'
require 'bitcoin_payable/commands/pricing_processor'
require 'bitcoin_payable/commands/payment_processor'

namespace :bitcon_payable do
  
  desc "Process the prices and update the payments"
  task :process_prices => :environment do
    BitcoinPayable::PricingProcessor.perfrom
  end
  
  desc "Connect to HelloBlock.io and process payments"
  task :process_payments => :environment do
    BitcoinPayable::PaymentProcessor.perform
  end
  
end
