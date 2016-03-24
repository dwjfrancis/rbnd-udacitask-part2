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
    size = @items.length
    @items.push TodoItem.new(description, options) if @type == "todo"
    @items.push EventItem.new(description, options) if @type == "event"
    @items.push LinkItem.new(description, options) if @type == "link"
    if(size == @items.length)
      raise UdaciListErrors::InvalidTypeError, "InvalidTypeError: #{@type} is not a list type."
    end
  end

  def delete(index)
    @items.delete_at(index - 1)
  end

#  def new
     
#  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
