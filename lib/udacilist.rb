class UdaciList
  attr_reader :title, :items, :type

  def initialize(options={})
    if(options[:title] != nil)
      @title = options[:title]
    else
      @title = "Untitled List"
    end
    @items = []
  end

  def add(type, description, options={})
    @type = type.downcase
    if(options[:priority] != nil) then check_priority(options[:priority])
    end
    if(istype?)
    @items.push TodoItem.new(@type, description, options) if @type == "todo"
    @items.push EventItem.new(@type, description, options) if @type == "event"
    @items.push LinkItem.new(@type, description, options) if @type == "link"
    else
      begin
        raise UdaciListErrors::InvalidTypeError, "InvalidTypeError: #{@type} is not a list type."
      rescue UdaciListErrors::InvalidTypeError => p
        puts p.message 
      end
    end
    if(@delete_it)
      delete(@items.length)
    end
  end

  def delete(index)
    if(index <= @items.length)
      @items.delete_at(index - 1)
    else
      begin
        raise UdaciListErrors::IndexExceedsListSize, "IndexExceedsListSize: this index is past the end of stored data."
      rescue UdaciListErrors::IndexExceedsListSize => p
        puts p.message
      end
    end
  end

  def istype?
    if(@type == "todo") then isit =  true

    elsif(@type == "event")then isit =  true
    elsif(@type == "link")then isit = true
    else isit = false
    end
    if(!isit)
      @delete_it = true
    end
    return isit
  end

  def check_priority(priority)
    if(priority == "low")then @delete_it = false
    elsif(priority == "medium") then @delete_it = false
    elsif(priority == "high") then @delete_it = false
    elsif(priority == "") then @delete_it = false
    else @delete_it = true
    end
    if(@delete_it)
      begin
        raise UdaciListErrors::InvalidPriorityValue, "InvalidPriorityValue #{priority} is not an acceptable value."
      rescue UdaciListErrors::InvalidPriorityValue => p
        puts p.message
      end
    end
  end

  def all
    a = Artii::Base.new(font: 'small')
    puts "-".colorize(:red) * @title.length
    puts a.asciify(@title).colorize(:blue)
    puts "-".colorize(:red) * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}".colorize(:green)
    end
  end

  def filter(type)
    puts "-".colorize(:red) * @title.length
    puts @title.colorize(:blue)
    puts "-".colorize(:red) * @title.length
    index = 0
    @items.each do |item|
      if(item.type == type)
        puts "#{index + 1}) #{item.details}".colorize(:green)
        index += 1
      end
    end    
    if(index == 0)
      puts "There are no elements of this type in this list."
    end
  end
end
