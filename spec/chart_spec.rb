require 'ooxml_builder'
require_relative 'test_fixture.rb'


describe 'suport for graphs ' do
  it 'create a graph chart' do
    presentation = double
    graph = OoxmlBuilder::Chart::Graph.new(presentation: presentation, content: TestFixture.graph_data)
    expect(graph.class).to be(OoxmlBuilder::Chart::Graph)
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

  it 'create a bar chart' do
    presentation = double
    bar = OoxmlBuilder::Chart::Bar.new(presentation: presentation, content: TestFixture.bar_data)
    expect(bar.class).to be(OoxmlBuilder::Chart::Bar)
  end

  it 'save a bar chart' do
    presentation = double
    bar = OoxmlBuilder::Chart::Bar.new(presentation: presentation, content: TestFixture.bar)

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(bar.save(extract_path, 1).class).to be(File)
    end
  end
end