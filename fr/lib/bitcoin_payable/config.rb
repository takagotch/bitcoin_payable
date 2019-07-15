require 'singleton'

module BitcoinPayable
  class Config
    include Singleton
    attr_accessor(
      #
      :master_public_key,
      :node_path,
      :currency,
      :adapter,
      :dapter_api_key,
      :testnet,
      :confirmations,
      :payment_variance,
      :processing_days,
      
      :open_exchange_key,
      :rate_calculation,
      
      :allowwebhooks,
      :webhook_subdomain,
      :webhook_domain,
      :webhook_port
    )
  
    def initialize
      @currency ||= :cad
      @confirmations ||= 6
      @rate_calculation ||= :daily_average
    
      @payment_variance ||= 0
    
      @processing_days ||= 30
    end
  
    def network
      @testnet == false ? :bitcoin : :bitcon_testnet
    end
  end
end

