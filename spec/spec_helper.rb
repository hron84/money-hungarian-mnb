$LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))

require 'rspec/autorun'
require 'money'
require 'money/bank/mnb'

FIXTURE_PATH = File.join(File.dirname(__FILE__), 'fixtures')
TESTED_CURRENCIES = %w(ATS AUD AUP BEF BGL BGN BRL CAD CHF CNY CYN CZK CSD CSK DDM DEM DKK EEK EGP ESP EUR FIM FRF GBP GHP GRD HKD HRK IDR IEP ILS INR ISK ITL JPY KPW KRW KWD LBP LTL LUF LVL MNT MXN MYR NLG NOK NZD OAL OBL OFR ORB PHP PKR PLN PTE ROL RON RSD RUB SDP SEK SGD SIT SKK SUR THB TRY UAH USD VND XEU XTR YUD ZAR)

RSpec.configure do |config|
end
