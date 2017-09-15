class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
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
  validates :contact_email, presence: true, uniqueness: true, email: true
  validates :phone_number, numericality: { only_integer: true, message: "use number only" }, length: { is: 10, message: "is too long"}, uniqueness: true
end
