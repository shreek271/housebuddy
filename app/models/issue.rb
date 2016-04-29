class Issue < ActiveRecord::Base

  belongs_to :customer
  belongs_to :service

  default_scope -> { order(created_at: :desc) }
  validates :customer_id, presence: true
  validates :service_id, presence:true
  validates :content, presence: true, length: { maximum: 500 }
  validates :address, presence: true
  validates :zip, presence: true, length: {  maximum:6 , minimum:6 }
  validates :city, presence: true

end
