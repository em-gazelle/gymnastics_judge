class Skill < ActiveRecord::Base
  has_many :events, through: :routines
  has_many :routines

  # data is largely static, limited only to 'superusers' who are able to add as new skills created or rules are updated
  
end