require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  class Workbook
    include OoxmlBuilder::Util

    attr_reader :work_sheets

    def initialize
      @work_sheets = []
    end


    def build_work_sheet(data)
      set_worksheed_name(data)
      # work_sheets << data

      # build and return hash with all tags needed by
      # the presentation to link seets
      data["_rel_tags"] = {"more_tage" => "fd"}

      data
    end



    def set_worksheed_name(data)
      data["file_name"] =
        "Microsoft_Excel_Worksheet" +
        data["index"].to_s +
        ".xlxs"
    end
    private :set_worksheed_name

    # Same as save from presenation.rb
    def save(path)
      # Render embedings here
      # save in ppt/embedings/Microsoft_Excel_Worksheet[n].xlxs

    end

  end
end
