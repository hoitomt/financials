require 'csv'

class UploadController < ApplicationController
  before_filter :set_title

  def new; end

  def account_data
    count = CheckingTransaction.process_file(params[:filename].path)
    flash[:message] = "#{count} records have been added"
    redirect_to new_upload_path
  end

  def credit_card_data
    count = CreditCardTransaction.process_file(params[:filename].path)
    flash[:message] = "#{count} records have been added"
    redirect_to new_upload_path
  end

  def description_tags
    count = DescriptionTag.process_file(params[:filename].path)
    flash[:message] = "#{count} records have been added"
    redirect_to new_upload_path
  end

  private
  def set_title
    @title = "Upload a File"
  end
end
