class Employee < ApplicationRecord
  has_many :time_sheets

  # returns a nested hash structure
  def self.calculate_pay(report_id=nil)
    pay_data = {}
    self.all.each do |emp|
      time_sheets = report_id.present? ? emp.time_sheets.where(report_id: report_id) : emp.time_sheets.all
      if time_sheets.length > 0
        pay_data[emp.id] = {}
        time_sheets.each do |ts|
          mid = ts.date.beginning_of_month + 15.days
          if ts.date < mid
            pay_date = ts.date.beginning_of_month.strftime("%d/%m/%Y") + " - " + (mid - 1.day).strftime("%d/%m/%Y")
          else
            pay_date = mid.strftime("%d/%m/%Y") + " - " + ts.date.end_of_month.strftime("%d/%m/%Y")
          end
          
          amount = ts.total_pay

          if pay_data[emp.id][pay_date].nil?
            pay_data[emp.id][pay_date] = amount
          else
            pay_data[emp.id][pay_date] += amount
          end
        end
      end
    end

    return pay_data
  end
end