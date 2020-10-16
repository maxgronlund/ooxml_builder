require 'ooxml_builder'
require_relative 'test_fixture.rb'

describe 'OoxmlBuilder exporting a sample PPTX file' do
  before(:all) do
    File.delete('./samples/pptx/sample.pptx') if File.exists? './samples/pptx/sample.pptx'
  end

  it 'Create a PPTX file with a line graph successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    @deck.add_graph_chart_slide TestFixture.graph
    @deck.save 'samples/pptx/sample.pptx'
    expect(@deck.slides.first.class).to be(OoxmlBuilder::Slide::Graph)
  end

  it 'Create a PPTX file with a bar braph successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    @deck.add_bar_chart_slide TestFixture.bar
    @deck.save 'samples/pptx/sample.pptx'
    expect(@deck.slides.first.class).to be(OoxmlBuilder::Slide::Bar)
  end

  it 'Create a PPTX file with a key insights successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    @deck.add_insights_slide TestFixture.insights
    @deck.save 'samples/pptx/sample.pptx'
    expect(@deck.slides.first.class).to be(OoxmlBuilder::Slide::Insights)
  end

  it 'Create a PPTX file with a results successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    @deck.add_results_slide TestFixture.results
    @deck.save 'samples/pptx/sample.pptx'
    expect(@deck.slides.first.class).to be(OoxmlBuilder::Slide::Results)
  end

  it 'Create a PPTX file with all slides successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    @deck.add_graph_chart_slide TestFixture.graph
    @deck.add_bar_chart_slide TestFixture.bar
    @deck.add_insights_slide TestFixture.insights
    @deck.add_results_slide TestFixture.results
    @deck.save 'samples/pptx/sample.pptx' # Examine the PPTX file
    expect(@deck.slides.size).to eq(4)
  end
end