# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id
    
  has_many :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id
    
  has_many :responses,
    through: :answer_choices,
    source: :responses
    
  def results
    results = self.responses.includes(:answer_choice)
    
    choices = Hash.new(0)
    
    results.each do |response|
      choices[response.answer_choice.text] += 1
    end
    
    choices    
  end  
    
end 
