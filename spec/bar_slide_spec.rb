require 'ooxml_builder'
require_relative 'test_fixture.rb'


describe 'OoxmlBuilder::Slide::BarChart' do
  before(:all) do
    @presentation = OoxmlBuilder::Presentation.new
    @content = TestFixture.bar_chart
  end

  it 'New creates a barchart with title and subtitle' do
    bar_chart =
      OoxmlBuilder::Slide::Bar
      .new(
        presentation: @presentation,
        title: @content[:title],
        subtitle: @content[:subtitle],
        content: @content
      )
    expect(bar_chart.title).to eq(@content[:title])
    expect(bar_chart.subtitle).to eq(@content[:subtitle])
  end

  it 'Save renders slide files' do
    content = TestFixture.bar_chart
    bar_chart =
      OoxmlBuilder::Slide::Bar
      .new(
        presentation: @presentation,
        title: @content[:title],
        subtitle: @content[:subtitle],
        content: @content
      )

    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime('%Y-%m-%d-%H%M%S')}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      index = 1
      bar_chart.save(extract_path, index)
      expect(Pathname.new("#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels")).to exist
      expect(Pathname.new("#{extract_path}/ppt/slides/slide#{index}.xml")).to exist
    end
  end
end