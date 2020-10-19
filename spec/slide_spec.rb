require 'ooxml_builder'
require_relative 'test_fixture.rb'


describe 'create slides ' do
  before(:all) do
    @presentation = double
  end

  it 'create a graph slide' do
    graph_slide = OoxmlBuilder::Slide::Graph.new(presentation: @presentation, content: TestFixture.graph)
    expect(graph_slide.class).to be(OoxmlBuilder::Slide::Graph)
  end

  it 'save a graph chart' do
    graph = OoxmlBuilder::Chart::Graph.new(presentation: @presentation, content: TestFixture.graph)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(graph.save(extract_path, 1).class).to be(File)
    end
  end

  it 'create a bar slide' do
    bar_slide = OoxmlBuilder::Slide::Bar.new(presentation: @presentation, content: TestFixture.bar)
    expect(bar_slide.class).to be(OoxmlBuilder::Slide::Bar)
  end

  it 'save a bar slide' do
    bar_slide = OoxmlBuilder::Slide::Graph.new(presentation: @presentation, content: TestFixture.bar)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(bar_slide.save(extract_path, 1).class).to be(File)
    end
  end

  it 'create a insight slide' do
    insight_slides = OoxmlBuilder::Slide::Insights.new(presentation: @presentation, content: TestFixture.insights)
    expect(insight_slides.class).to be(OoxmlBuilder::Slide::Insights)
  end

  it 'save a insithts slide' do
    insights_slide = OoxmlBuilder::Slide::Insights.new(presentation: @presentation, content: TestFixture.insights)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(insights_slide.save(extract_path, 1).class).to be(File)
    end
  end

  it 'create a results slide' do
    results_slide = OoxmlBuilder::Slide::Results.new(presentation: @presentation, content: TestFixture.results)
    expect(results_slide.class).to be(OoxmlBuilder::Slide::Results)
  end

  it 'save a results slide' do
    results_slide = OoxmlBuilder::Slide::Results.new(presentation: @presentation, content: TestFixture.results)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(results_slide.save(extract_path, 1).class).to be(File)
    end
  end
end