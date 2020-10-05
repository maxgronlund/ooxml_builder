require 'awesome_print'
# require 'ooxml_builder'


module OoxmlBuilder
  class API

    # Public interface.
    def build_presentation(data)

      # TODO: make api version check
      return unless data["version"] == 1.0

      @presentation = OoxmlBuilder::Presentation.new
      @workbook = OoxmlBuilder::Workbook.new
      data["slides"].each_with_index do|slide, index|
        @title, @subtitle = slide["title"], slide["subtitle"]
        parse_slide(slide, index)
      end

      @presentation.save data["save_path"] = data["file_name"] # Examine the PPTX file
    end

    #
    def parse_slide(slide, index)
      case slide["type"]
      when "vertical_bars"
        parse_vertical_bars(slide, index)
      when "graph"
        parse_graph(slide, index)
      else
        puts 'WTF'
      end
    end
    private :parse_slide

    def parse_graph(slide, index)
      # ap slide
    end
    private :parse_graph

    def parse_vertical_bars(slide, index)
      slide["work_sheet_data"]["index"] = index
      work_sheet_data = @workbook.build_work_sheet(slide["work_sheet_data"])

      @presentation.add_bar_chart_slide(@title, @subtitle, work_sheet_data)
      # @presentation.add_bar_chart_slide(@title, @subtitle, work_sheet_data)

      # ap slide
    end
  end
end