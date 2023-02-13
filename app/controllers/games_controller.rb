require 'open-uri'
class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.shuffle[0..10]
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].split

    @included = @word.split('').all? do |letter|
      @letters.include?(letter)
    end

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @data = JSON.parse(URI.open(url).read)
    @english = @data['found'] == true
  end
end
