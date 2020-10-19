require 'ooxml_builder'
require_relative 'test_fixture.rb'


describe 'create slides ' do
  it 'create a graph slide' do
    presentation = double
    graph_slide = OoxmlBuilder::Slide::Graph.new(presentation: presentation, content: TestFixture.graph)
    expect(graph_slide.class).to be(OoxmlBuilder::Slide::Graph)
  end

  it 'save a graph chart' do
    presentation = double
    graph = OoxmlBuilder::Chart::Graph.new(presentation: presentation, content: TestFixture.graph)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(graph.save(extract_path, 1).class).to be(File)
    end
  end

  it 'create a bar slide' do
    presentation = double
    bar_slide = OoxmlBuilder::Slide::Bar.new(presentation: presentation, content: TestFixture.bar)
    expect(bar_slide.class).to be(OoxmlBuilder::Slide::Bar)
  end

  it 'save a bar slide' do
    presentation = double
    bar_slide = OoxmlBuilder::Slide::Graph.new(presentation: presentation, content: TestFixture.bar)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(bar_slide.save(extract_path, 1).class).to be(File)
    end
  end

  it 'create a insight slide' do
    presentation = double
    insight_slides = OoxmlBuilder::Slide::Insights.new(presentation: presentation, content: TestFixture.insights)
    expect(insight_slides.class).to be(OoxmlBuilder::Slide::Insights)
  end

  it 'save a insithts slide' do
    presentation = double
    insights_slide = OoxmlBuilder::Slide::Insights.new(presentation: presentation, content: TestFixture.insights)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(insights_slide.save(extract_path, 1).class).to be(File)
    end
  end

  it 'create a results slide' do
    presentation = double
    results_slide = OoxmlBuilder::Slide::Results.new(presentation: presentation, content: TestFixture.results)
    expect(results_slide.class).to be(OoxmlBuilder::Slide::Results)
  end

  it 'save a results slide' do
    presentation = double
    results_slide = OoxmlBuilder::Slide::Results.new(presentation: presentation, content: TestFixture.results)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(results_slide.save(extract_path, 1).class).to be(File)
    end
  end

  # it 'create a bar chart' do
  #   presentation = double
  #   bar = OoxmlBuilder::Chart::Bar.new(presentation: presentation, content: TestFixture.bar_data)
  #   expect(bar.class).to be(OoxmlBuilder::Chart::Bar)
  # end

  # it 'save a bar chart' do
  #   presentation = double
  #   bar = OoxmlBuilder::Chart::Bar.new(presentation: presentation, content: TestFixture.bar)

  #   Dir.mktmpdir do |dir|
  #     extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
  #     FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
  #     expect(bar.save(extract_path, 1).class).to be(File)
  #   end
  # end
end