class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.name == 'asd'
      record.errors[:name] << "name not valid"
    end
  end
end
class Doctor < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :patient
  validates :degree, presence: true, inclusion: { in: %w(asd qwe zxc) }, format: { with: /[A-z]/ }
  validates :name, confirmation: true
  validates :name_confirmation, presence: { strict: true }
  validates_with MyValidator

end


