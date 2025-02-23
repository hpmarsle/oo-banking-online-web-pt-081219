require "pry" 
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end 
  
  def execute_transaction
    if @status == "pending" && valid? && @sender.balance >= @amount
    # binding.pry 
      @status = "complete"
      @sender.balance -= amount
      @receiver.balance += amount
    elsif @sender.balance < @amount || @status = "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."  
    end
  end 
  
  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
 
      @receiver.balance -= @amount
      @sender.balance += @amount
    end 
  end 
end
