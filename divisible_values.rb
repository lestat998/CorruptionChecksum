require_relative "corruption_checksum"

class DivisibleValues < CorruptionChecksum
    def divisible_numbers(params)
        temp = {}
        params.each do |key, value|
            for i in (0)..(value.length - 1)
                for j in (i + 1)..(value.length - 1)
                    if (value[j] % value[i]) == 0 || (value[i] % value[j]) == 0
                       temp[key] = [value[j], value[i]]
                    end
                end
            end
        end
        temp
    end

    def add_file(param)
        add = 0
        param.each do |key, value|
            div = value[0] / value[1]
            add = add + div
        end
        add
    end
end