require 'fileutils'
require 'erb'

module OoxmlBuilder
  module Slide
    class Insights
      include OoxmlBuilder::Util

      attr_reader :content, :workbook

      def initialize(options={})
        require_arguments [:content], options
        options.each {|k, v| instance_variable_set("@#{k}", v)}
        @chart = OoxmlBuilder::Chart::Graph.new(presentation: @presentation, content: content)
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
      end

      def save_rel_xml(extract_path, index)
        columns = @content[:data]
        render_view(
          'insights/slide_rel.xml.erb', "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels",
          {index: index, columns: columns}
        )
      end
      private :save_rel_xml

      def save_slide_xml(extract_path, index)
        columns = @content[:data]

        render_view(
          'insights/slide.xml.erb', "#{extract_path}/ppt/slides/slide#{index}.xml",
          {
            title: @content[:title],
            subtitle: @content[:subtitle],
            period: @content[:period],
            index: index,
            columns: columns,
            suffix: @content[:suffix]
          }
        )
      end
      private :save_slide_xml
    end
  end
end
