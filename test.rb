require 'minitest/autorun'
require_relative 'app'

class TestWeatherReport < MiniTest::Test 
    def setup
        @weather_report = WeatherReport.new
    end
    def test_default_report
        assert_includes @weather_report.report, "No weather data yet!"
    end
    def test_celcius_to_fahrenheit
        @weather_report.celsius = 20
        assert_equal 68, @weather_report.c_to_f
    end
    def test_display_celsius_if_celsius_is_given
        @weather_report.celsius = 20
        assert_includes @weather_report.report, "Today's temperature is 20C!"
    end 
    def test_display_fahrenheit_if_fahrenheit_is_given
        @weather_report.fahrenheit = 50
        assert_includes @weather_report.report, "Today's temperature is 50F!"
    end
    def test_correctly_reports_hot_weather
        @weather_report.fahrenheit = 80
        assert_includes @weather_report.report, "It's hot out!"
    end
    def test_correctly_reports_warm_weather
        @weather_report.fahrenheit = 60
        assert_includes @weather_report.report, "It's warm out!"
    end
    def test_correctly_reports_cold_weather
        @weather_report.fahrenheit = 59 
        assert_includes @weather_report.report, "It's cold out!"
    end 
    def test_rain_message
        @weather_report.rain = true
        assert_includes @weather_report.report, "You may want to wear a raincoat."
    end
    def test_snow_message
        @weather_report.snow = true
        assert_includes @weather_report.report, "You may want to wear snow boots."
    end
end

