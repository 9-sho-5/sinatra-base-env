require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection

# タイムゾーンの設定
Time.zone = 'Tokyo'
ActiveRecord::Base.default_timezone = :local
