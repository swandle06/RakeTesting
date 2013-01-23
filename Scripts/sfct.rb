require "rinruby"
require "fileutils"

class SFCT

  def initialize (echo = "true", interactive = "true", executable = "R")
    #Create R instance for analysis
    @myR = RinRuby.new(echo = false) #, interactive = false, executable = "R")
    @myR.cwd = FileUtils.pwd
    @myR.eval "setwd(cwd)"
  end

  #Specific analysis functions
  def create_eset(esetFile, esetR)
    #  combineExpData.pl
    #  eSample2phenoData.pl
    FileUtils.touch(esetFile)
    @myR.eval %Q{load ("RFiles/fastloMedian.RData")}
  end

end
