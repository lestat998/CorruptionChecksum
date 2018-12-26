class CorruptionChecksum
    attr_accessor :path

    def initialize(args)
        @path       = args[:path]
        @data       = CorruptionChecksum.input_data(@path)
    end

    def self.input_data(param)
        file = File.open(param, "r")
        data = file.read
        file.close
        data
    end

    def create_hash        
        data = @data.to_s.split("\n")
        rows = {}
        data.each_with_index do |value, index|
            rows[index] = value.split("\t").map(&:to_i)
        end
        rows
    end

    def sort_array(param)
        for i in (param.length - 1).downto(0)
            for j in 1..i
                if param[j - 1] > param[j]
                    temp = param[j - 1]
                    param[j - 1] = param[j]
                    param[j] = temp
                end
            end
        end        
    end

    def sort_array_in_hash(param)
        param.each do |key, value|
           sort_array(value)            
        end        
    end

    def add_file(param)
        add = 0
        param.each do |key,value|
            rest = value.last - value.first
            add = add + rest
        end
        add      
    end

end


