class Group < ApplicationRecord

  has_many :students
  belongs_to :user

  def grade_group
    grade.to_s + " " + group
  end

end
