def super_print(string, options={})
  if options.empty?
    puts string
    return nil
  else
    if options.keys.include?(:times)
      string << " #{options[:times]}x"
      options.delete(:times)
    end
    options.each_key do |option|
      string = string.send(option)
    end
  end
  puts string
end