require 'rails_helper'

RSpec.describe LinksController, type: :controller do
 
    it "can shorten a link provided by the user" do
        request.env["HTTP_ACCEPT"] = "text/javascript"
        
        url="https://gapfish.com/welcome/"
       
        #This is correct rails syntax
        #post "/links", params: { link: { original_url:url} }

        #This syntax works in rspec, tries to finds the route associated with create
        post :create, params: { link: { original_url:url } }
        link = assigns(:link)

        expect(link.original_url).to eq(url)
        expect(link.valid?).to be(true)
        expect(link.lookup_code.length).to eq(7)
        expect(link.persisted?).to be(true)
        expect(response).to render_template('create')

    end

end