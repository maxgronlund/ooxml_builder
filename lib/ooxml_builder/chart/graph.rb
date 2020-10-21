# frozen_string_literal: true

require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'

module OoxmlBuilder
  module Chart
    # Functions for building a chart slide
    class Graph
      include OoxmlBuilder::Util

      def initialize(options = {})
        require_arguments [:content], options
        options.each { |k, v| instance_variable_set("@#{k}", v) }
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_chart_xml(extract_path, index)
      end

      private

      def save_rel_xml(extract_path, index)
        render_view(
          'chart/chart_rel.xml.erb',
          "#{extract_path}/ppt/charts/_rels/chart#{index}.xml.rels",
          index: index
        )
      end

      def save_chart_xml(extract_path, index)
        render_view(
          'graph/chart.xml.erb',
          "#{extract_path}/ppt/charts/chart#{index}.xml",
          params
        )
      end

      def save_colors(extract_path, index)
        render_view(
          'chart/colors.xml.erb',
          "#{extract_path}/ppt/charts/colors#{index}.xml",
          index: index
        )
      end

      def params
        content = @content[:data].dup
        content.delete(:Column1)
        {
          rows: content,
          suffix: @content[:suffix],
          subtitle: @content[:subtitle],
          reach: @content[:reach]
        }
      end
    end
  end
end
