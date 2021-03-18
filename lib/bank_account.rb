class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    def initialize (name_of_account)
        @name = name_of_account
        @balance = 1000
        @status = "open"
    end

    def deposit (amount_of_money)
        @balance += amount_of_money
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @balance > 0 && @status == "open"
    end

    def close_account
        @status = "closed"
    end
end
