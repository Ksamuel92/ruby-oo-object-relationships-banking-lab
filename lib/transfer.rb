require "pry"
class Transfer
  # your code here

attr_accessor :status, :amount, :sender, :receiver
  

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    #binding.pry
  end

  def valid?
  @sender.valid? && @receiver.valid?
  end

  def reject_transfer
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end
end
