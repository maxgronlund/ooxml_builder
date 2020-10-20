# frozen_string_literal: true

require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'

module OoxmlBuilder
  class Workbook
    # Class for building a Excel Worksheet
    include OoxmlBuilder::Util

    def initialize(options = {})
      require_arguments [:content], options
      options.each { |k, v| instance_variable_set("@#{k}", v) }
    end

    def save(extract_path, index)
      to_path = "#{extract_path}/ppt/embeddings/Microsoft_Excel_Worksheet#{index}"
      from_path = "#{OoxmlBuilder::TEMPLATE_PATH}/Microsoft_Excel_Worksheet"
      FileUtils.cp_r(from_path, to_path)
      FileUtils.mkdir_p "#{to_path}/xl/tables"
      save_shared_strings(to_path)
      save_table(to_path)
      save_sheet(to_path)
      compress(to_path)
    end

    private

    def save_shared_strings(extract_path)
      render_view(
        'workbook/shared_strings.xml.erb',
        "#{extract_path}/xl/sharedStrings.xml",
        data: @content[:data]
      )
    end

    def save_table(extract_path)
      ids = @content[:data].first
      render_view(
        'workbook/table.xml.erb',
        "#{extract_path}/xl/tables/table1.xml",
        id1: ids.first,
        id2: ids.last,
        rows: @content[:data].size
      )
    end

    def save_sheet(extract_path)
      render_view(
        'workbook/sheet.xml.erb',
        "#{extract_path}/xl/worksheets/sheet1.xml",
        data: @content[:data]
      )
    end

    def compress(extract_path)
      OoxmlBuilder.compress(extract_path, "#{extract_path}.xlsx")
      FileUtils.rm_rf(extract_path)
    end
  end
end
