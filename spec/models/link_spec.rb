require 'rails_helper'

RSpec.describe Link, type: :model do
    
    it "it is valid if it always have an original URL and a short_code" do 
        link = Link.new(
            original_url: "https://gapfish.com/welcome/",
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(true)
    end

    it "it is invalid if it does not have a short_code" do 
        link = Link.new(
            original_url: "https://gapfish.com/welcome/"
        )
        expect(link.valid?).to be(false)
    end

    it "it is invalid if it does not have a original_url" do 
        link = Link.new(
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(false)
    end

    it "it is valid if the lookup_code provided is unique" do 
        link = Link.new(
            original_url: "https://gapfish.com/welcome/",
            lookup_code: "1234567"
        )
        link.save

        link2 = Link.new(
            original_url: "https://gapfish.com/about/",
            lookup_code: "1234567"
        )
        expect(link2.valid?).to be(false)
    end

    it "it is valid if the original_url provided is unique" do 
        link = Link.new(
            original_url: "https://gapfish.com/welcome/",
            lookup_code: "1234567"
        )
        link.save

        link2 = Link.new(
            original_url: "https://gapfish.com/welcome/",
            lookup_code: "7654321"
        )
        expect(link2.valid?).to be(false)
    end

end 
