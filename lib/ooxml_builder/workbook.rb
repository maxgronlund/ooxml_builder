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
      to_path = "#{extract_path}/ppt/embeddings/Microsoft_Excel_Worksheet#{index}"
      from_path = "#{OoxmlBuilder::TEMPLATE_PATH}/Microsoft_Excel_Worksheet"
      FileUtils.cp_r(from_path, to_path)

      save_rel_xml(to_path, index)
      save_workbook(to_path, index)
      compress_workbook(to_path, index)
    end

    def save_rel_xml(extract_path, index)
      render_view('workbook_rel.xml.erb', "#{extract_path}/xl/_rels/workbook.xml.rels", index: index)
    end
    private :save_rel_xml

    def save_workbook(extract_path, index)
      render_view('workbook.xml.erb', "#{extract_path}/xl/workbook.xml", index: index)
    end
    private :save_workbook

    def compress_workbook(to_path, index)
      OoxmlBuilder.compress(to_path, "#{to_path}.xlsx")
      FileUtils.remove_dir(to_path)
    end
    private :compress_workbook
  end
end
