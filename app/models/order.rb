class Order < ActiveRecord::Base
  include AASM

  default_scope -> { where(deleted: false) }

  phony_normalize :phone, :default_country_code => 'UA'

  validates :from_street, :from_house, :to_street, :to_house, :phone, presence: true

  enum status: [:in_process, :sended, :declined]
  enum circumstances: [:not_set, :'Не устроила цена', :'Не подошло время', :'Не удобен сам сервис']

  aasm column: :status, whiny_transitions: false, no_direct_assignment: true do
    state :in_process, :initial => true
    state :sended
    state :declined

    event :sended do
      transitions from: :in_process, to: :sended
    end

    event :declined do
      transitions from: :in_process, to: :declined
    end
  end
end
