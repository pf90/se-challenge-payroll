class ReportsController < ApplicationController

  def index
    @payment_info = Employee.calculate_pay()
  end

  def new

  end

  def create
    if params[:file].present?
      begin
        report_id = Report.import(params[:file])
        redirect_to report_path(report_id), notice: "Successfully Imported Time Report: #{report_id}"
      rescue => e
        msg = "Import failed. Error: " + e.message
        redirect_to new_report_path, notice: msg
      end
    else
      flash[:notice] = "No file attached for import."
      redirect_to new_report_path
    end
  end

  def show
    @report_id = params[:id]
    @payment_info = Employee.calculate_pay(@report_id)
  end

end