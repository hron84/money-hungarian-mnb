require 'spec_helper'

describe Money::Bank::MNB do
  before(:each) do
    @bank = Money::Bank::MNB.new
    
    @bank.stub!(:mnb_client).and_return(nil)

    @bank.stub!(:fetch_currencies_from_wsdl).and_return(File.read(FIXTURE_PATH + '/currencies.xml'))
    @bank.stub!(:fetch_rates_from_wsdl).and_return(File.read(FIXTURE_PATH + '/rates.xml'))

    Money.default_bank = @bank
  end

  context 'integration with Money api' do
    it 'should exchanges between USD and CAD' do
      Money.new(100, 'USD').exchange_to('CAD').fractional.should eq 102
      Money.new(102, 'CAD').exchange_to('USD').fractional.should eq 99 # rounding
    end

    it 'should exchanges currency with non-default unit' do
      Money.new(10000, 'IDR').exchange_to('HUF').fractional.should eq 229 # base
      Money.new(10000, 'IDR').exchange_to('USD').fractional.should eq 1 # another currency
    end
  end
end
