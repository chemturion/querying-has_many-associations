class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.order_by_location_name
    order(:name)
  end

  def self.with_employees
    where(manager_id: nil)
  end

  def self.with_employees_order_by_location_name
    with_employees.order_by_location_name
  end
end
