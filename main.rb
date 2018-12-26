require_relative "corruption_checksum"
require_relative "divisible_values"


corruption = CorruptionChecksum.new(path: "input.txt")
dataHash = corruption.create_hash
dataSort = corruption.sort_array_in_hash(dataHash)
data = corruption.add_file(dataSort)

puts "your puzzle answer is #{data}"

divisible = DivisibleValues.new(path: "input.txt")
newData = divisible.divisible_numbers(dataSort)
finalData = divisible.add_file(newData)

puts "your puzzle answer is #{finalData}"
