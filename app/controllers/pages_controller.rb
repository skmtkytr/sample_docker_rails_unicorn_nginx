class PagesController < ApplicationController

  # loginしてないとpagesへこれないように
  before_action :sign_in_required, only: [:show]

  def index
    p
  end

  def show
    p
  end
end
