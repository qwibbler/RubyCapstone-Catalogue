class ListLabels < ListData
  def list(data)
    return "No Labels found\n\n" if data.empty?

    data.select! { |item| item.instance_of?(Label) }
    data.each_with_index { |label, index| get_properties(label, index, %w[Title Color], [label.title, label.color]) }
  end
end