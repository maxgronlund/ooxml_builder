require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  class Workbook
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

      # TODO: remove and add views to static files
      # save_workbook_rel(to_path, index)
      # save_workbook(to_path, index)

      save_shared_strings(to_path, index)
      save_table(to_path, index)
      save_sheet(to_path, index)

      # save_sheet_rel(to_path, index)

      compress_work_sheet(to_path, index)
    end

    # def save_workbook_rel(extract_path, index)
    #   render_view('workbook_rel.xml.erb', "#{extract_path}/xl/_rels/workbook.xml.rels", index: index)
    # end
    # private :save_workbook_rel

    # def save_workbook(extract_path, index)
    #   render_view('workbook.xml.erb', "#{extract_path}/xl/workbook.xml", index: index)
    # end
    # private :save_workbook

    def save_shared_strings(extract_path, index)
      render_view('workbook/shared_strings.xml.erb', "#{extract_path}/xl/sharedStrings.xml", data: @content[:data])
    end
    private :save_shared_strings

    def save_table(extract_path, index)
      ids = @content[:data].first
      render_view('workbook/table.xml.erb', "#{extract_path}/xl/tables/table1.xml", id1: ids.first, id2: ids.last)
    end
    private :save_table

    def save_sheet(extract_path, indes)
      render_view('workbook/sheet.xml.erb', "#{extract_path}/xl/worksheets/sheet1.xml", data: @content[:data])
    end

    def compress_work_sheet(extract_path, index)
      OoxmlBuilder.compress(extract_path, "#{extract_path}.xlsx")
      FileUtils.rm_rf(extract_path)
    end
    private :compress_work_sheet
  end
end
