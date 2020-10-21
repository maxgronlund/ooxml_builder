# frozen_string_literal: true

require 'fileutils'
require 'erb'

module OoxmlBuilder
  module Slide
    # Class for building an insight slide
    class Insights
      include OoxmlBuilder::Util

      attr_reader :content

      def initialize(options = {})
        require_arguments [:content], options
        options.each { |k, v| instance_variable_set("@#{k}", v) }
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
      end

      private

      def save_rel_xml(extract_path, index)
        render_view(
          'insights/slide_rel.xml.erb',
          "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels",
          index: index,
          content: content,
          columns: content[:data],
          images: images
        )
      end

      def save_slide_xml(extract_path, index)
        render_view(
          'insights/slide.xml.erb',
          "#{extract_path}/ppt/slides/slide#{index}.xml",
          params(index)
        )
      end

      def images
        @images ||= @content[:data].collect { |a| a[:img] }
      end

      def params(index)
        {
          title: @content[:title],
          subtitle: @content[:subtitle],
          period: @content[:period],
          index: index,
          columns: @content[:data],
          images: images,
          suffix: @content[:suffix]
        }
      end
    end
  end
end
