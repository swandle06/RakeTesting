require "yaml"
require "fileutils"
require "rake/clean"

require "~/lib/Ruby/myRake"
require "./Scripts/sfct"

@config = Hash[YAML.load_file("config.yml").map{|(k,v)| [k.to_sym,v]}]

$loggerLog = MyRake::create_log(@config[:logger])
$loggerLog.info(@config)

task :startR do
  @myAnalysis = SFCT.new(@config[:echo])
end
