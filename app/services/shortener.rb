class Shortener

    attr_reader :url, :link_model

    def initialize(url, link_model = Link)
        @url = url
        @link_model = link_model
    end

    # def lookup_code
    #     new_code = ""
    #     7.times do |x|
    #         new_code << (rand * x).round
    #     end
    #     new_code
    # end

    def lookup_code

        #if link_model.exists?(original_url)
            #then return the look up code associated with it

        #quick fix to get past need for a unique value each time
        if link_model.exists?(original_url: url) then
            url << "x"
        end
        
        i = 0
        loop do 
            #Not best strategy as may run out of characters 
            code = get_fresh_code(i)
            break code unless link_model.exists?(lookup_code: code)
            i = i + 1
        end

    end

    def generate_short_link
        #Without the ! the creation will fail "quietly", wont throw error 
        link_model.create!(original_url: url, lookup_code: lookup_code)
    end


    private

    #The seperation of this method from the loop allows us to change the algorithm easily
    def get_fresh_code(i)
        Digest::SHA1.hexdigest(url)[i..(i+6)]
    end
    


end