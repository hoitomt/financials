class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.includes(:tags)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
end
