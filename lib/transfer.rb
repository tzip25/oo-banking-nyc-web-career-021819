class Transfer
  require 'pry'

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    #sender subtract amount
    #receive add amount
    if sender.balance > amount
        if self.status == "pending"
          sender.balance -= self.amount
          receiver.balance += self.amount
          self.status = "complete"
        else
          "rejected"
        end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
