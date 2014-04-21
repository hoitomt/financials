class ReportsController < ApplicationController
  def index
    @month = params[:month] || DateTime.now.month
    @monthly_report = Report::MonthlyReport.new(@month)
  end
end
