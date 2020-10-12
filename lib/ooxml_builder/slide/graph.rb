require 'fileutils'
require 'erb'
require 'awesome_print'

module OoxmlBuilder
  module Slide
    class Graph
      include OoxmlBuilder::Util

      attr_reader :title, :subtitle, :content, :workbook, :chart

      def initialize(options={})
        require_arguments [:title, :subtitle, :content], options
        options.each {|k, v| instance_variable_set("@#{k}", v)}

        @workbook = OoxmlBuilder::Workbook.new(presentation: @presentation, content: content)
        @chart = OoxmlBuilder::Chart::Graph.new(presentation: @presentation, content: content)
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
        @workbook.save(extract_path, index)
        @chart.save(extract_path, index)
      end

      def save_rel_xml(extract_path, index)
        render_view('chart_slide_rel.xml.erb', "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels", {index: index})
      end
      private :save_rel_xml

      def save_slide_xml(extract_path, index)
        render_view('chart_slide.xml.erb', "#{extract_path}/ppt/slides/slide#{index}.xml", {title: @title, subtitle: @subtitle, index: index})
      end
      private :save_slide_xml
    end
  end

end
