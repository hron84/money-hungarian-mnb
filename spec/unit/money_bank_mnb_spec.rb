require 'spec_helper'

describe Money::Bank::MNB do
  

  before(:each) do
    @bank = Money::Bank::MNB.new
    
    @bank.stub!(:mnb_client).and_return(nil)

    @bank.stub!(:fetch_currencies_from_wsdl).and_return(File.read(FIXTURE_PATH + '/currencies.xml'))
    @bank.stub!(:fetch_rates_from_wsdl).and_return(File.read(FIXTURE_PATH + '/rates.xml'))
  end

  context 'currencies' do
    it 'should not be blank' do
      @bank.currencies.should_not be_blank
    end

    TESTED_CURRENCIES.each do |curr|
      it "includes #{curr}" do
        @bank.currencies.should be_include curr
      end
    end

    it 'should not include unknown currency' do
      @bank.currencies.should_not be_include 'ABC'
    end
  end

  context 'exchange_rates' do
    it 'should convert from USD to HUF' do
      rate = @bank.get_rate 'USD', 'HUF'
      rate.should eq 222.23
    end

    it 'should convert from HUF to USD' do
      rate = @bank.get_rate 'HUF', 'USD'
      rate.should eq 1 / 222.23
    end

    it 'should thows an exception for unknown currency' do
      expect do
        rate = @bank.get_rate 'ABC', 'HUF'
      end.to raise_error Money::Currency::UnknownCurrency
    end
  end
end
