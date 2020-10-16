require 'awesome_print'
require 'fileutils'
require 'erb'

module OoxmlBuilder
  module Slide
    class Results
      include OoxmlBuilder::Util

      attr_reader :content, :workbook

      def initialize(options = {})
        require_arguments [:content], options
        options.each { |k, v| instance_variable_set("@#{k}", v) }
        @chart = OoxmlBuilder::Chart::Graph.new(presentation: @presentation, content: content)
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
      end

      private

      def save_rel_xml(extract_path, index)
        render_view(
          'results/slide_rel.xml.erb',
          "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels",
          index: index, results: @content[:data]
        )
      end

      def save_slide_xml(extract_path, index)
        render_view(
          'results/slide.xml.erb',
          "#{extract_path}/ppt/slides/slide#{index}.xml",
          title: @content[:title],
          subtitle: @content[:subtitle],
          period: @content[:period],
          index: index,
          results: @content[:data],
          suffix: @content[:suffix]
        )
      end
    end
  end
end

# rId6 arrow-red-down.emf
# rId9 arrow-green-up.emf
# rid12 arrow-gray-up
# rid15 arrow-gray-down