class WelcomeController < ApplicationController
  def home

    @quotes = [
      ['“Failure is not an option. Everyone has to Succeed”','- Arnold Schwarzeneggar'],
      ['“Your time is limited, so don\'t waste it living someone else\'s life.”','- Steve Jobs'],
      ['“BEtter Ingredients, Better Pizza”','- Papa John\'s']
      ]


  end


end
