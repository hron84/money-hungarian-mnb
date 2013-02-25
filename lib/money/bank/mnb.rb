require 'savon'

class Money
  module Bank
    class MNB < Money::Bank::VariableExchange
      WSDL_URL = 'http://www.mnb.hu/arfolyamok.asmx?WSDL'

      VERSION = File.read(File.expand_path('../../../', File.dirname(__FILE__)))

      attr_reader :rates

      def setup
        HTTPI.log = false
        @rates = {}
      end

      def flush_rates
        mutex.synchronize do
          @rates = {}
        end
      end

      def flush_rate(from, to)
        key = rate_key_for(from, to)
        mutex.synchronize do
          @rates.delete(key)
        end
      end

      def get_rate(from, to)
        mutex.synchronize do
          @rates[rate_key_for(from, to)] ||= fetch_rate(from, to)
        end
      end

      def fetch_rate(from, to)
        from, to = Currency.wrap(from).iso_code.to_s, Currency.wrap(to).iso_code.to_s
        
        # Providing usable error messages
        raise UnknownRate, "Source currency '#{from}' is not known by this module" unless currencies.include?(from)
        raise UnknownRate, "Target currency '#{to}' is not known by this module" unless currencies.include?(to)
        
        rsp = fetch_rates_from_wsdl

        doc = Nokogiri::XML.parse(rsp)

        ## Rates are specified in HUF, so we have to lookup both side before convert
        ## If any currency is HUF then it will be constant 1
        from_rate = from == 'HUF' ? 1 : 0
        to_rate = to == 'HUF' ? 1 : 0

        doc.css('Rate').each do |rate|
          curr = rate['curr']
          next unless [from, to].include?(curr)

          ## XXX Bank provides exchange rates in hungarian number notation form!
          value = rate.text.sub(',', '.').to_f

          unit = rate['unit'].to_i

          if curr == from
            from_rate = value / unit
          else
            to_rate = value / unit
          end
        end
        
        from_rate / to_rate
      end

      def currencies
        @currencies ||= []
        return @currencies unless @currencies.empty?

        doc = Nokogiri::XML.parse fetch_currencies_from_wsdl
        @currencies = doc.css('Curr').collect(&:text)
        @currencies << 'HUF'
        
        @currencies
      end

      def mnb_client
        @client ||= Savon.client(:wsdl => WSDL_URL, :log => false)
      end

      def fetch_rates_from_wsdl
        rsp = mnb_client.call :get_current_exchange_rates

        raise UnknownRate, "Bank returned with an error response" unless rsp.success?
        
        rsp.body[:get_current_exchange_rates_response][:get_current_exchange_rates_result]
      end

      def fetch_currencies_from_wsdl
        rsp = mnb_client.call :get_info

        raise UnknownRate, "Bank returned with an error response" unless rsp.success?

        rsp.body[:get_info_response][:get_info_result]
      end

      private

      def mutex
        @mutex ||= Mutex.new
      end
    end
  end
end
