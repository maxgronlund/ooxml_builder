require 'fileutils'
require 'erb'
require 'awesome_print'

module OoxmlBuilder
  module Slide
    class BarChart
      include OoxmlBuilder::Util

      attr_reader :title, :subtitle, :content

      def initialize(options={})
        require_arguments [:title, :subtitle, :content], options

        options.each {|k, v| instance_variable_set("@#{k}", v)}
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
      end

      def save_rel_xml(extract_path, index)
        # TODO: use index instead of 2
        render_view('bar_chart_rel.xml.erb', "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels", {index: 2})
      end
      private :save_rel_xml

      def save_slide_xml(extract_path, index)
        render_view('bar_chart_slide.xml.erb', "#{extract_path}/ppt/slides/slide#{index}.xml", {title: @title, subtitle: @subtitle})
      end
      private :save_slide_xml
    end
  end
end
