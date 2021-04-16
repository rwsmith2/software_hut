# == Schema Information
#
# Table name: assessments
#
#  assessment_title :string           not null
#  assessment_id    :integer          not null, primary key
#
class Assessment < ApplicationRecord
  has_many :assessment_linker, dependent: :delete_all
  has_many :questions , dependent: :delete_all
  belongs_to :task, optional: true
  accepts_nested_attributes_for :questions, allow_destroy: true
  
end
