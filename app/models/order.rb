class Order < ActiveRecord::Base
  include AASM

  enum status: [:in_process, :sended, :declined]
  enum circumstances: [:not_set, :service, :price, :time]

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
