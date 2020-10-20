# frozen_string_literal: true

require 'fileutils'
require 'erb'

module OoxmlBuilder
  module Slide
    class Graph
      # Class for building a graph slide
      include OoxmlBuilder::Util

      attr_reader :content, :presentation

      def initialize(options = {})
        require_arguments [:content], options
        options.each { |k, v| instance_variable_set("@#{k}", v) }
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
        workbook.save(extract_path, index)
        chart.save(extract_path, index)
      end

      private

      def workbook
        @workbook ||=
          OoxmlBuilder::Workbook.new(
            content: content
          )
      end

      def chart
        @chart ||=
          OoxmlBuilder::Chart::Graph.new(
            content: content
          )
      end

      def save_rel_xml(extract_path, index)
        render_view(
          'slide/slide_rel.xml.erb',
          "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels",
          index: index
        )
      end

      def save_slide_xml(extract_path, index)
        render_view(
          'slide/slide.xml.erb',
          "#{extract_path}/ppt/slides/slide#{index}.xml",
          params(index)
        )
      end

      def params(index)
        {
          title: content[:title],
          subtitle: content[:subtitle],
          index: index,
          period: content[:period]
        }
      end
    end
  end
end
