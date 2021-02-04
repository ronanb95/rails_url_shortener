class Link < ApplicationRecord

    validates_presence_of(:original_url)
    validates_presence_of(:lookup_code)

    validates_uniqueness_of(:original_url)
    validates_uniqueness_of(:lookup_code)

end
