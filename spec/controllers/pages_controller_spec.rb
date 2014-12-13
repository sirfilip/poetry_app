require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe '#home' do 
    it "shows the latest 10 publications" do 
      publications = [double]
      expect(Publication).to receive(:latest).and_return(publications) 
      get :home
      expect(assigns(:publications)).to eq publications
    end
  end
end
