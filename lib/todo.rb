class TodoItem
# initial code from udacity
# Author for calling conversions and methods: David Francis
#
  include Listable
  attr_reader :description, :due, :priority, :type

  def initialize(type, description, options={})
    @type = type
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
