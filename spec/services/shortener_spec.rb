require "rails_helper"
require "digest/sha2"

RSpec.describe Shortener do

    it "reduces a long url to a much smaller and manageable code of size 7 (same as bitly)" do
        url="https://gapfish.com/welcome/"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "gives each URL a unique lookup code" do
        url="https://gapfish.com/welcome/"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url="https://gapfish.com/about/"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).not_to eq(code_1)
    end

    it "gives each valid Link record a look_up code that is unique" do
        url="https://gapfish.com/welcome/"
        shortener = Shortener.new(url)
        link1 = shortener.generate_short_link

        link2 = shortener.generate_short_link

        link3 = shortener.generate_short_link

        expect(link3.valid?).to eq(true)
    end

end