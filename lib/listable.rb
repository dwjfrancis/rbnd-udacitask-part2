module Listable

  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(options={})
    Time.now
    dates = options[:start_date].strftime("%D") if options[:start_date]
    dates << " -- " + options[:end_date].strftime("%D") if options[:end_date]
    dates = options[:due] ? Chronic.parse(options[:due]).strftime("%D") : "No due date"
    dates = "N/A" if !dates
    return dates
  end

  def format_priority(priority)
    value = "invalid"
    value = " ⇧" if priority == "high"
    value = " ⇨" if priority == "medium"
    value = " ⇩" if priority == "low"
    value = "" if !priority
#    if(@priority == "invalid")
#      begin
#        raise UdaciListErrors::InvalidPriorityValue, "InvalidPriorityValue #{priority} is not an acceptable value."
#      rescue UdaciListErrors::InvalidPriorityValue => p
#        puts p.message
#      end
#      @priority = ""
#    end
    return value
  end

end
