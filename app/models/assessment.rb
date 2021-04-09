# == Schema Information
#
# Table name: assessments
#
#  assessment_title :string           not null
#  assessment_id    :integer          not null, primary key
#
class Assessment < ApplicationRecord
  has_many :assessment_linker
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true
  
end
