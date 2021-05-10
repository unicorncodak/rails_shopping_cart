require 'net/http'
class Paystack
    def initialize(public_key, secret_key)
        @public_key = public_key
        @secret_key = secret_key
    end

    def getKey
        uri = URI("https://api.paystack.co/transaction/initialize")
        res = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
        return @public_key
    end
end