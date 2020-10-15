require 'ooxml_builder'
require_relative 'test_fixture.rb'
require 'awesome_print'

describe 'OoxmlBuilder exporting a sample PPTX file' do
  before(:all) do
    File.delete('./samples/pptx/sample.pptx') if File.exists? './samples/pptx/sample.pptx'
    # secure file is deleted before it's opened
    sleep 1
  end

  it 'Create a PPTX file with a line graph successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    graph_data = TestFixture.graph
    @deck.add_graph_chart_slide graph_data[:title], graph_data[:subtitle], graph_data
    @deck.save 'samples/pptx/sample.pptx'
  end

  it 'Create a PPTX file with a bar braph successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    bar_data = TestFixture.bar
    @deck.add_bar_chart_slide bar_data[:title], bar_data[:subtitle], bar_data
    @deck.save 'samples/pptx/sample.pptx'
  end

  it 'Create a PPTX file with a key insights successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    key_insights_data = TestFixture.insights
    @deck.add_insights_slide key_insights_data[:title], key_insights_data[:subtitle], key_insights_data
    @deck.save 'samples/pptx/sample.pptx'
  end

  it 'Create a PPTX file with a results successfully.' do
    @deck = OoxmlBuilder::Presentation.new
    results_data = TestFixture.results
    @deck.add_results_slide results_data[:title], results_data[:subtitle], results_data
    @deck.save 'samples/pptx/sample.pptx'
  end

  it 'Create a PPTX file with all slides successfully.' do
    @deck = OoxmlBuilder::Presentation.new

    graph_data = TestFixture.graph
    @deck.add_graph_chart_slide graph_data[:title], graph_data[:subtitle], graph_data

    bar_data = TestFixture.bar
    @deck.add_bar_chart_slide bar_data[:title], bar_data[:subtitle], bar_data

    key_insights_data = TestFixture.insights
    @deck.add_insights_slide key_insights_data[:title], key_insights_data[:subtitle], key_insights_data

    results_data = TestFixture.results
    @deck.add_results_slide results_data[:title], results_data[:subtitle], results_data

    @deck.save 'samples/pptx/sample.pptx' # Examine the PPTX file
  end

  describe 'OoxmlBuilder.compression create a xlsx file' do
    it 'Create a XLSX file from a folder.' do
      Dir.mktmpdir do |dir|
        in_path = File.expand_path("../test_data", __FILE__)
        OoxmlBuilder.compress("#{in_path}/xlsx", "#{dir}/test_data.xlsx")
        pathname = Pathname.new("#{dir}/test_data.xlsx")
        expect(File.exist?(pathname)).to be(true)
      end
    end
  end
end