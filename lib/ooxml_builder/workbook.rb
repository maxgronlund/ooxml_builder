require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  class Workbook
    include OoxmlBuilder::Util

    attr_reader :work_sheets

    def initialize
      @sheets = []
    end


    def build_work_sheet(data)
      file_name = "Microsoft_Excel_Worksheet" + data["index"].to_s + ".xlxs"
      # work_sheets << data


      data["_rel_tags"] = {"more_tage" => "fd"}

      data
    end




    # Same as save from presenation.rb
    def save(path)
      # Render embedings here
      # save in ppt/embedings/Microsoft_Excel_Worksheet[n].xlxs

    end

  end
end
