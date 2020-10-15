require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  module Chart
    class Bar
      include OoxmlBuilder::Util

      def initialize(options={})
        require_arguments [:content], options
        options.each { |k, v| instance_variable_set("@#{k}", v) }
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_chart_xml(extract_path, index)
      end

      def save_rel_xml(extract_path, index)
        render_view('bar/chart_rel.xml.erb', "#{extract_path}/ppt/charts/_rels/chart#{index}.xml.rels", index: index)
      end
      private :save_rel_xml

      def save_chart_xml(extract_path, index)
        content = @content[:data].dup
        content.delete(:Column1)
        params = { rows: content, suffix: @content[:suffix], subtitle: @subtitle }
        render_view('bar/chart.xml.erb', "#{extract_path}/ppt/charts/chart#{index}.xml", params)
      end
        private :save_chart_xml
    end
  end
end
