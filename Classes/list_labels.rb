class ListLabels < ListData
  def list_labels(data)
    return puts "No Labels found\n\n" if data.empty?

    data.each_with_index { |label, index| list(index, { 'Title' => label.title, 'Color' => label.color }) }
  end
end
