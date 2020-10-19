require 'ooxml_builder'
require_relative 'test_fixture.rb'
require 'awesome_print'

describe 'OoxmlBuilder exporting a sample PPTX file' do
  before(:all) do
    File.delete('./samples/pptx/sample.pptx') if File.exists? './samples/pptx/sample.pptx'
  end

  before(:each) do
    @presentation = OoxmlBuilder::Presentation.new
  end

  it 'Create a PPTX file with a line graph successfully.' do
    @presentation.add_graph_chart_slide TestFixture.graph
    @presentation.save 'samples/pptx/sample.pptx'
    expect(@presentation.slides.first.class).to be(OoxmlBuilder::Slide::Graph)
  end

  it 'Create a PPTX file with a bar braph successfully.' do
    @presentation.add_bar_chart_slide TestFixture.bar
    @presentation.save 'samples/pptx/sample.pptx'
    expect(@presentation.slides.first.class).to be(OoxmlBuilder::Slide::Bar)
  end

  it 'Create a PPTX file with a key insights successfully.' do
    @presentation.add_insights_slide TestFixture.insights
    @presentation.save 'samples/pptx/sample.pptx'
    expect(@presentation.slides.first.class).to be(OoxmlBuilder::Slide::Insights)
  end

  it 'Create a PPTX file with a results successfully.' do
    @presentation.add_results_slide TestFixture.results
    @presentation.save 'samples/pptx/sample.pptx'
    expect(@presentation.slides.first.class).to be(OoxmlBuilder::Slide::Results)
  end

  it 'Create a PPTX file with all slides successfully.' do
    @presentation.add_graph_chart_slide TestFixture.graph
    @presentation.add_bar_chart_slide TestFixture.bar
    @presentation.add_insights_slide TestFixture.insights
    @presentation.add_results_slide TestFixture.results
    @presentation.save 'samples/pptx/sample.pptx' # Examine the PPTX file
    expect(@presentation.slides.size).to eq(4)
  end
end