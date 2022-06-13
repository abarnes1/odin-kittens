class KittensController < ApplicationController
  def index
    @kittens = Kitten.all.order(:name)
  end
end