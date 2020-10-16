require 'awesome_print'
require 'ooxml_builder'
require_relative 'test_fixture.rb'

describe 'OoxmlBuilder exporting a sample PPTX file' do
  # before(:all) do
  #   File.delete('./samples/pptx/sample.pptx') if File.exists? './samples/pptx/sample.pptx'
  #   # secure file is deleted before it's opened
  #   sleep 1
  # end

  # it 'Create a chart.xml file' do
  #   graph_slide = OoxmlBuilder::Slide::Graph.new(presentation: nil, content: TestFixture.graph)

  #   # Dir.mktmpdir do |dir|
  #   #   extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"

  #   #   graph_slide.save(extract_path, 1)
  #   # end
  #   # @deck = OoxmlBuilder::Presentation.new
  #   # @deck.add_graph_chart_slide TestFixture.graph
  #   # @deck.save 'samples/pptx/sample.pptx'
  #   # expect(@deck.slides.first.class).to be(OoxmlBuilder::Slide::Graph)
  # end
end