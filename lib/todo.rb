class TodoItem
# initial code from udacity
# Author for calling conversions and methods: David Francis
#
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
#    due_date = Chronic.parse(options[:due])
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]).strftime("%D") : Chronic.parse(options[:due])
    @priority = options[:priority]
  end
  
  def details
    format_description(@description) + "due: " +
    format_date(due: @due) +
    format_priority(@priority)
  end
 
end
