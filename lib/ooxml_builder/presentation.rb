require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'

module OoxmlBuilder
  class Presentation
    include OoxmlBuilder::Util

    attr_reader :slides, :charts

    def initialize
      @slides = []
      @charts = 1
    end

    def add_graph_chart_slide(content = {})
      @slides << OoxmlBuilder::Slide::Graph.new(presentation: self, content: content)
      @charts += 1
    end

    def add_bar_chart_slide(content = {})
      @slides << OoxmlBuilder::Slide::Bar.new(presentation: self, content: content)
      @charts += 1
    end

    def add_results_slide(content = {})
      @slides << OoxmlBuilder::Slide::Results.new(presentation: self, content: content)
    end

    def add_insights_slide(content = {})
      @slides << OoxmlBuilder::Slide::Insights.new(presentation: self, content: content)
    end

    def save(path)
      Dir.mktmpdir do |dir|
        extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"

        # Copy template to temp path
        FileUtils.copy_entry(TEMPLATE_PATH, extract_path)

        build_folders(extract_path, charts > 1)

        # build_folders(extract_path, SLIDE_FOLDERS)
        # if charts > 1
        #   build_folders(extract_path, CHART_FOLDERS)
        # end

        # Remove keep files
        Dir.glob("#{extract_path}/**/.keep").each do |keep_file|
          FileUtils.rm_rf(keep_file)
        end

        # Render/save generic stuff
        render_view('content_type.xml.erb', "#{extract_path}/[Content_Types].xml")
        render_view('presentation.xml.rel.erb', "#{extract_path}/ppt/_rels/presentation.xml.rels")
        render_view('presentation.xml.erb', "#{extract_path}/ppt/presentation.xml")
        render_view('app.xml.erb', "#{extract_path}/docProps/app.xml")

        # Save slides
        slides.each_with_index do |slide, index|
          slide.save(extract_path, index + 1)
        end

        # Save charts
        charts.times do |index|
          render_view('chart/colors.xml.erb', "#{extract_path}/ppt/charts/colors#{index}.xml", index: index)
          render_view('chart/style.xml.erb', "#{extract_path}/ppt/charts/style#{index}.xml", index: index)
        end



        # Remove template
        #FileUtils.rm_rf("#{extract_path}/Microsoft_Excel_Worksheet")

        # Create .pptx file
        File.delete(path) if File.exist?(path)
        OoxmlBuilder.compress(extract_path, path)
      end

      path
    end
  end
end
