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
          suffix: @content[:suffix],
          arrows: arrows,
          icons: icons
        )
      end

      def arrows
        @content[:data].collect do |result|
          case result[:arrow]
          when "red-down"
            'rId6'
          when "green-up"
            'rId9'
          when "gray-up"
            'rId12'
          when "gray-down"
            'rId15'
          end
        end
      end

      def icons
        @content[:data].collect do |result|
          case result[:img]
          when 'sack-dollar'
            4
          when 'users'
            7
          when 'rotating-arrows'
            10
          when 'dollar-arrow'
            13
          when 'app-install'
            16
          when 'dollar-app-install'
            18
          end
        end
      end
    end
  end
end
