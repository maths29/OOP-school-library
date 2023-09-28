class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement correct_name'
  end
end
