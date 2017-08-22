class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      # if name.to_s.end_with?('=')
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
      define_method("#{name}") do
        instance_variable_get("@#{name}")
      end
    end
  end
end
