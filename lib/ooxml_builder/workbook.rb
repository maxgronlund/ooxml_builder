require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  class Workbook
    include OoxmlBuilder::Util

    attr_reader :work_sheets

    def initialize(options={})
      require_arguments [:content], options
      options.each { |k, v| instance_variable_set("@#{k}", v) }
    end

    def save(extract_path, index)
      save_rel_xml(extract_path, index)
      save_chart_xml(extract_path, index)
    end

    def save_rel_xml(extract_path, index)


      index = '2'

      render_view('chart_rel.xml.erb', "#{extract_path}/ppt/charts/_rels/chart#{index}.xml.rels", index: index)
    end
    private :save_rel_xml

    def save_chart_xml(extract_path, index)

      index = '2'

      # remove first row
      @content[:data].delete(:Column1)
      params = { rows: @content[:data], suffix: @content[:suffix] }

      render_view('chart.xml.erb', "#{extract_path}/ppt/charts/chart#{index}.xml", params)


      # render_view('chart.xml.erb', "#{extract_path}/ppt/embeddings/Microsoft_Excel_Worksheet#{index}.xml")
    end
      private :save_chart_xml
  end
end
