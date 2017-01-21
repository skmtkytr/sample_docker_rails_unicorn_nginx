require 'rails_helper'
require 'rails-controller-testing'
Rails::Controller::Testing.install

RSpec.describe 'TOP', type: :feature, js: true do
  before(:all) do
    Capybara.current_driver = :selenium
  end

  context 'shows' do
    it 'welcome message' do
      visit root_path # 「/」にアクセスしたら
      expect(page).to have_text('welcome') # 「welcome」と表示される

    end
  end

  after(:all) do
    Capybara.use_default_driver
  end
end
