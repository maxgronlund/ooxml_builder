require 'ooxml_builder'
require_relative 'test_fixture.rb'
require 'awesome_print'

describe 'OoxmlBuilder exporting a sample PPTX file' do
  before(:all) do
    File.delete('./samples/pptx/sample.pptx') if File.exists? './samples/pptx/sample.pptx'
    sleep 1
  end

  it 'Create a PPTX file successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    #   Chart slides
    bar_data = TestFixture.bar_chart
    @deck.add_bar_chart_slide bar_data[:title], bar_data[:subtitle], bar_data

    @deck.save 'samples/pptx/sample.pptx' # Examine the PPTX file
  end
end
