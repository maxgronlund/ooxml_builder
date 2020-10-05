require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  class Workbook
    include OoxmlBuilder::Util

    attr_reader :work_sheets

    def initialize(options={})
      ap options

    end


    def save(extract_path, index)
        save_rel_xml(extract_path, index)
        # save_chart_xml(extract_path, index)
      end

      def save_rel_xml(extract_path, index)
        render_view('workbook_rel.xml.erb', "#{extract_path}/ppt/charts/_rels/chart#{index}.xml.rels", index: index)
      end
      private :save_rel_xml

      def save_chart_xml(extract_path, index)

        # render_view('workbook_chart.xml.erb', "#{extract_path}/ppt/embedings/Microsoft_Excel_Worksheet#{index}.xml")
      end
      private :save_chart_xml
  end
end
