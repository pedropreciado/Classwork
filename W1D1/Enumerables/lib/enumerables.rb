class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    result = []

    self.each do |e|
      result << e if prc.call(e)
    end
    result
  end

  def my_reject(&prc)
    result = []

    self.each do |e|
      result << e unless prc.call(e)
    end

    result
  end

  def my_any?(&prc)
    self.each do |e|
      return true if prc.call(e)
    end
    false
  end

  def my_flatten
    result = []

    self.each do |el|
      if !el.is_a?(Array)
        result << el
      else
        el.my_flatten.each do |sub_el|
          result << sub_el
        end
      end
    end
    result
  end

  def my_zip(*args)
    result = Array.new(self.length) {Array.new(args.length + 1)}

    combined_arr = [self] + args

    (0...combined_arr.length).each do |i|
      (0...result.length).each do |j|
        result[j][i] = combined_arr[i][j]
      end
    end

    result
  end

  def my_rotate(shift = 1)
    result = self.dup
    self.each_index do |i|
      result[i] = self[(i + shift) % self.length]
    end
    result
  end

  def my_join(str = "")
    result = ""
    self.each do |ltr|
      result << "#{ltr}#{str}"
    end
    if str == ""
      return result
    end
    result[0...-1]
  end

  def my_reverse
    result = []
    (0...self.length).each do |i|
      result << self[self.length - 1 - i]
    end
    result
  end

  def 
end
