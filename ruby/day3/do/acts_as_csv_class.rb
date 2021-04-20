module ActsAsCsv

  class CsvRow

    def initialize(headers, row)
      @headers = headers
      @row = row
    end

    def method_missing name
      index = @headers[name.to_s]
      @row[index]
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstaceMethods
    end
  end

  module InstaceMethods
    def read
      @csv_contents = []
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ').each_with_index.map {|x, i| [x, i]}.to_h

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def each
      @csv_contents.each { |row| yield CsvRow.new(@headers, row) }
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}
