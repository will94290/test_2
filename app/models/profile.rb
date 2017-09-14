class Test_mail < ActiveModel::Validator
  def validate(record)
    if /@/.match(record.contact_email) == nil
      record.errors[:base] << "Bad address"
    end
  end
end

class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/image/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :contact_email, presence: true, uniqueness: true
  validates :phone_number, numericality: { only_integer: true }, length: { is: 10}, uniqueness: true
  validates_with Test_mail
end
