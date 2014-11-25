class Faq < ActiveRecord::Base
  attr_accessor :questions

  def initialize (questions)
    @questions = questions
  end

end
