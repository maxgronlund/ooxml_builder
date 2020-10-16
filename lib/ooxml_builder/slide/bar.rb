require 'fileutils'
require 'erb'

module OoxmlBuilder
  module Slide
    class Bar
      include OoxmlBuilder::Util

      attr_reader :title, :subtitle, :content, :workbook, :chart

      def initialize(options = {})
        require_arguments [:content], options
        options.each { |k, v| instance_variable_set("@#{k}", v) }
        @workbook = OoxmlBuilder::Workbook.new(presentation: @presentation, content: content)
        @chart = OoxmlBuilder::Chart::Bar.new(presentation: @presentation, content: content)
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
        @workbook.save(extract_path, index)
        @chart.save(extract_path, index)
      end

      private

      def save_rel_xml(extract_path, index)
        render_view('slide/slide_rel.xml.erb', "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels", index: index)
      end

      def save_slide_xml(extract_path, index)
        render_view(
          'slide/slide.xml.erb',
          "#{extract_path}/ppt/slides/slide#{index}.xml",
          title: @content[:title], subtitle: @content[:subtitle], index: index, period: @content[:period]
        )
      end
    end
  end
end
