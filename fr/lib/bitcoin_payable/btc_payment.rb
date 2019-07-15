#require 'bitcoin-addrgen'
require 'money-tree'
require 'aasm'

module BitcoinPayable
  class BitcoinPayment < ::ActiveRecord::Base
    include AASM
    belongs_to :payable, polymorphic: true
    has_many :transactions, class_name: "BitcoinPayable::BitcoinPaymentTransaction"

    validates :reason, presence: true
    validates :price, presence: true

    before_create :populate_currency_and_amount_due



  end
end


