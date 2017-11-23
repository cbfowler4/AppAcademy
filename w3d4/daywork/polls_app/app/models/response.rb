# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  respondent_id    :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :not_duplicate_response, :not_author_of_poll
  
  belongs_to :respondent,
    class_name: :User,
    foreign_key: :respondent_id,
    primary_key: :id
    
  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id
    
  has_one :question,
    through: :answer_choice,
    source: :question
    
    
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    sibling_responses.exists?(self.respondent_id)
  end
  
  def not_duplicate_response
    if respondent_already_answered?
      errors[:frequency] << "Cannot repeat response"
    end 
  end
  
  def respondent_is_author?
    self.question.poll.author_id == self.respondent_id
  end
  
  def not_author_of_poll
    if respondent_is_author?
      errors[:author] << "Author cannot respond to own poll"
    end
  end
end 
