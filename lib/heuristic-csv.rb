require "heuristic-csv/version"

class CSV
  def self.heuristic_parse(data = $stdout, options = Hash.new, &block)
    if block_given?
      begin
        self.parse(data, options, &block)
      rescue Exception => e
        data = self.remove_misplaced_quotes(data, options)
        self.parse(data, options, &block)
      end
    end
  end
  
  private
  
  # Strategy 1: Replace misplaced quotes using regular expressions and remove it
  def self.remove_misplaced_quotes(data, options)
    if options.nil? or options[:col_sep].nil?
      sep = DEFAULT_OPTIONS[:col_sep]
    else
      sep = options[:col_sep]
    end
    strings_with_problems = data.scan(/\"([^\n#{sep}]*\"[^\n#{sep}]*)\"[\n#{sep}]+/)
    strings_with_problems.each do |string|
      data.gsub!(string.first, string.first.gsub("\"", ""))
    end
    return data
  end
end
