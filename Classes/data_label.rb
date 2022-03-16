require 'json'
require_relative './label'

class LabelData
  def self.path
    './data/label.json'
  end

  def self.save_data(data)
    new_data = data.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    File.write(LabelData.path, JSON.generate(new_data))
  end

  def self.read_data
    return [] unless File.exist?(LabelData.path)

    result = JSON.parse(File.read(LabelData.path)) unless File.read(LabelData.path) == ''
    result.map { |label| Label.new(label['title'], label['color'], label['id']) }
  end
end
