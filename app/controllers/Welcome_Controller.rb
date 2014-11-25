class WelcomeController < ApplicationController
  def home

    @quotes = [
      ['“Git to tha choppa!”','- Arnold Schwarzeneggar'],
      ['“Why\'s this turtleneck so itchy?”','- Steve Jobs'],
      ['“I actually loathe pizza.”','- Papa John\'s']
      ]


  end


end
