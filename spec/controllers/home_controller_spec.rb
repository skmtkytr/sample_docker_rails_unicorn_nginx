require 'rails_helper'
require 'rails-controller-testing'
Rails::Controller::Testing.install

RSpec.describe HomeController, type: :controller do

  context 'GET #welcome' do
    it 'shows welcome message' do
      get :welcome
      expect(assigns(:msg)).to eq('welcome') # @msg ＝ 'welcome' をテストしています
    end
  end

end
