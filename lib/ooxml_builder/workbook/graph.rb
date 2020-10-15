require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  class Workbook
    class Graph
      include OoxmlBuilder::Util

      # attr_reader :work_sheets

      def initialize(options={})
        require_arguments [:content], options
        options.each { |k, v| instance_variable_set("@#{k}", v) }
      end

      def save(extract_path, index)
        to_path = "#{extract_path}/ppt/embeddings/Microsoft_Excel_Worksheet#{index}"
        from_path = "#{OoxmlBuilder::TEMPLATE_PATH}/Microsoft_Excel_Worksheet"
        FileUtils.cp_r(from_path, to_path)

        save_shared_strings(to_path, index)
        save_table(to_path, index)
        save_sheet(to_path, index)
        compress(to_path, index)
      end


      def save_shared_strings(extract_path, index)
        render_view('graph/workbook/shared_strings.xml.erb', "#{extract_path}/xl/sharedStrings.xml", data: @content[:data])
      end
      private :save_shared_strings

      def save_table(extract_path, index)
        ids = @content[:data].first
        render_view('graph/workbook/table.xml.erb', "#{extract_path}/xl/tables/table1.xml", id1: ids.first, id2: ids.last)
      end
      private :save_table

      def save_sheet(extract_path, indes)
        render_view('graph/workbook/sheet.xml.erb', "#{extract_path}/xl/worksheets/sheet1.xml", data: @content[:data])
      end

      def compress(extract_path, index)
        OoxmlBuilder.compress(extract_path, "#{extract_path}.xlsx")
        FileUtils.rm_rf(extract_path)
      end
      private :compress
    end
  end
end