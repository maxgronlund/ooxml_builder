require 'ooxml_builder'
require_relative 'test_fixture.rb'
require 'awesome_print'

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
