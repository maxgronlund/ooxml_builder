require 'fileutils'
require 'erb'

module OoxmlBuilder
  module Slide
    class Results
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
          'results/slide_rel.xml.erb',
          "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels",
          index: index, results: @content[:data], arrows: arrows, images: images
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
          suffix: @content[:suffix],
          arrows: arrows,
          images: images
        )
      end

      def arrows
        @arrows ||= @content[:data].collect { |a| a[:arrow] }
      end

      def images
        @images ||= @content[:data].collect { |a| a[:img] }
      end
    end
  end
end
