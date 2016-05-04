class WeatherReport
    attr_writer :fahrenheit, :rain, :snow, :celsius
    
    def initialize
        @report = []
    end
    
    def report
        @report << "Today's temperature is #{@celsius}C!" if @celsius
        @report << "Today's temperature is #{@fahrenheit}F!" if @fahrenheit && !@celsius
        @report << "It's hot out!" if is_hot?
        @report << "It's warm out!" if is_warm?
        @report << "It's cold out!" if is_cold?
        @report << "No weather data yet!" if @report.size == 0 
        return @report
    end
    def is_hot?
        if @fahreneheit
            return @fahrenheit >= 80
        elsif @celsius
            return c_to_f >= 80 
        else
            return false
        end
    end
    def is_warm?
        if @fahreneheit
            return @fahreneheit < 80 && @fahreneheit >= 60
        elsif @celsius
            return c_to_f < 80 && c_to_f >= 60 
        else
            return false 
        end
    end
    def is_cold?
        if @fahreneheit
            return @fahreneheit < 60
        elsif @celsius
            return c_to_f < 60 
        else
            return false
        end
    end
    def c_to_f
        @celsius * 1.8 + 32
    end
end

