require_relative '../lib/ooxml_builder/util'
require_relative '../lib/ooxml_builder'
include OoxmlBuilder::Util
include OoxmlBuilder

require 'fileutils'
require 'tmpdir'

describe 'Util' do
  it 'returns nil if required arguments are valid' do
    expect(require_arguments([:content], content: 'some content')).to eq(nil)
  end

  it 'raise an ArgumentError if arguments are invalid' do
    expect { require_arguments [:content], {} }.to raise_error(ArgumentError)
  end

  it 'raise an Errno::ENOENT error if no template is found' do
    expect { render_view('fo', 'bar') }.to raise_error(Errno::ENOENT)
  end

  it 'renders a template' do
    Dir.mktmpdir do |dir|
      result = render_view('bar/chart_rel.xml.erb', "#{dir}/chart1.xml", index: 1)
      expect(result.class).to be(File)
    end
  end
end
