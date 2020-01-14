class TimeSheet < ApplicationRecord
  belongs_to :employee
  belongs_to :report

  RATES = { "A" => 20.00, "B" => 30.00 }

end