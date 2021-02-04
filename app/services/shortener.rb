class Shortener

    attr_reader :url

    def initialize(url)
        @url = url
    end

    # def lookup_code
    #     new_code = ""
    #     7.times do |x|
    #         new_code << (rand * x).round
    #     end
    #     new_code
    # end

    def lookup_code
        Digest::SHA1.hexdigest(url)[0..6]
    end

end