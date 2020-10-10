require 'zip/filesystem'
require 'fileutils'
require 'tmpdir'
require 'awesome_print'

module OoxmlBuilder
  class Presentation
    include OoxmlBuilder::Util

    attr_reader :slides, :charts, :workbooks

    def initialize
      @slides = []
      @charts = []
      @workbooks = []
    end

    def add_intro(title, subtitle = nil)
      existing_intro_slide = @slides.select {|s| s.class == OoxmlBuilder::Slide::Intro}[0]
      slide = OoxmlBuilder::Slide::Intro.new(presentation: self, title: title, subtitle: subtitle)
      if existing_intro_slide
        @slides[@slides.index(existing_intro_slide)] = slide
      else
        @slides.insert 0, slide
      end
    end

    def add_blank_slide(title, content = [])
      @slides << OoxmlBuilder::Slide::Blank.new(presentation: self, title: title, content: content)
    end


    def add_bar_chart_slide(title, subtitle, content = {})
      @workbooks << OoxmlBuilder::Workbook.new(presentation: self, content: content)
      @charts << OoxmlBuilder::Chart.new(presentation: self, content: content)
      @slides << OoxmlBuilder::Slide::BarChart.new(presentation: self, title: title, subtitle: subtitle, content: content)
    end

    def add_textual_slide(title, content = [])
      @slides << OoxmlBuilder::Slide::Textual.new(presentation: self, title: title, content: content)
    end

    def add_pictorial_slide(title, image_path, coords = {})
      @slides << OoxmlBuilder::Slide::Pictorial.new(presentation: self, title: title, image_path: image_path, coords: coords)
    end

    def add_text_picture_slide(title, image_path, content = [])
      @slides << OoxmlBuilder::Slide::TextPicSplit.new(presentation: self, title: title, image_path: image_path, content: content)
    end

    def add_picture_description_slide(title, image_path, content = [])
      @slides << OoxmlBuilder::Slide::DescriptionPic.new(presentation: self, title: title, image_path: image_path, content: content)
    end

    def save(path)

      Dir.mktmpdir do |dir|
        extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"


        # Copy template to temp path
        FileUtils.copy_entry(TEMPLATE_PATH, extract_path)

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
        charts.each_with_index do |chart, index|
          chart.save(extract_path, index + 1)
        end

        # Save workbooks
        workbooks.each_with_index do |workbook, index|
          workbook.save(extract_path, index + 1)
        end
        FileUtils.rm_rf("#{extract_path}/Microsoft_Excel_Worksheet")

        # Create .pptx file
        File.delete(path) if File.exist?(path)
        OoxmlBuilder.compress(extract_path, path)
      end

      path
    end

    def file_types
      slides.map {|slide| slide.file_type if slide.respond_to? :file_type }.compact.uniq
    end
  end
end
