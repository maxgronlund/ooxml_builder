require 'ooxml_builder'
require_relative 'test_fixture.rb'
require 'awesome_print'

describe 'OoxmlBuilder exporting a sample PPTX file' do
  before(:all) do
    File.delete('./samples/pptx/sample.pptx') if File.exists? './samples/pptx/sample.pptx'
    # secure file is deleted before it's opened
    sleep 1
  end


  it 'Create a PPTX file successfully.' do
    @deck = OoxmlBuilder::Presentation.new

    #   Chart slides
    bar_data = TestFixture.bar_chart
    @deck.add_bar_chart_slide bar_data[:title], bar_data[:subtitle], bar_data



  #   Needs to be implemented:
  #   @deck.add_line_chart_slide data: {....}
  #   @deck.add_pie_chart_slide data: {....}

  #   Standard slides
  #   @deck.add_intro 'Bicycle Of the Mind', 'created by Steve Jobs'
    # @deck.add_blank_slide 'A1', ['B', 'C1']
  #   @deck.add_textual_slide 'Why Mac?', ['Its cool!', 'Its light!']
  #   @deck.add_pictorial_slide 'JPG Logo', 'samples/images/sample_png.png'
  #   @deck.add_text_picture_slide('Text Pic Split', 'samples/images/sample_png.png', content = ['Here is a string', 'here is another'])
  #   @deck.add_picture_description_slide('Pic Desc', 'samples/images/sample_png.png', content = ['Here is a string', 'here is another'])

    @deck.save 'samples/pptx/sample.pptx' # Examine the PPTX file
  end

  # it 'Create a .xlsx files in the embeddings folder' do
  #   puts "fo"

  # end
end
