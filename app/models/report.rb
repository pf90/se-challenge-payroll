require 'csv'

class Report < ApplicationRecord
  has_many :time_sheets

  def self.import(file)
    if File.extname(file.original_filename) == '.csv'

      last_line = find_last_line(file).split(',')
      report_id = last_line.second.to_i

      reports = Report.where(id: report_id)
      if reports.length == 0
        report = Report.create(id: report_id)

        CSV.foreach(file.path, headers: true) do |row|
          next if row['date'] == 'report id'
          
          employee_id = row['employee id']
          employees = Employee.where(id: employee_id)
          employee = employees.length > 0 ? employees[0] : Employee.create!(id: employee_id)

          ts = TimeSheet.new
          ts.employee = employee
          ts.report_id = report_id
          ts.date = row['date']
          ts.hours_worked = row['hours worked']
          ts.job_group = row['job group']
          rate = TimeSheet::RATES[ts.job_group]
          ts.total_pay = ts.hours_worked * rate
          ts.save
        end
        return report_id
      else
        raise StandardError.new("Report #{report_id} already exists.")
      end
    else
      raise StandardError.new("File type '#{file.original_filename}' was not recognised as a csv")
    end
  end

  private

  def self.find_last_line(file)
    f = File.open(file.path)
    f.seek(-2, IO::SEEK_END)
    last_line = nil

    while f.pos > 0
      if f.getc == "\n"
        last_line = f.read
        break
      else
        f.pos -= 2
      end
    end

    last_line = f.read unless last_line
    f.close
    return last_line
  end

end