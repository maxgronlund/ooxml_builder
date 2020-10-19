require 'ooxml_builder'
require_relative 'test_fixture.rb'


describe 'suport for workbooks ' do
  before(:all) do
    @presentation = double
  end

  it 'create a workbook' do
    workbook = OoxmlBuilder::Workbook.new(presentation: @presentation, content: TestFixture.graph)
    expect(workbook.class).to eq(OoxmlBuilder::Workbook)
  end

  it 'save a workbook' do
    workbook = OoxmlBuilder::Workbook.new(presentation: @presentation, content: TestFixture.graph)
    Dir.mktmpdir do |dir|
      extract_path = "#{dir}/extract_#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
      FileUtils.copy_entry(OoxmlBuilder::TEMPLATE_PATH, extract_path)
      expect(workbook.save(extract_path, 1).class).to be(Array)
    end
  end
end