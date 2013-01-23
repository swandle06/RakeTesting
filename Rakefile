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

file "RFiles/#{@config[:esetfile]}" do |f|
  if File.exist?("Data/#{@config[:esetfile]}")
    FileUtils.cp("Data/#{@config[:esetfile]}", "RFiles/#{@config[:esetfile]}")
  else
    assembleEsetR = File.new(@config[:esetAssemblyQC])
    @myAnalysis.create_eset(f.name, assembleEsetR)
  end
  puts "created eset file"
end
CLOBBER.include(@config[:esetfile])
