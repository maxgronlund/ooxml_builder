require "ooxml_builder/version"
require 'ooxml_builder/util'
require 'ooxml_builder/compression'
require 'ooxml_builder/presentation'
require 'ooxml_builder/charts/graph'
require 'ooxml_builder/charts/bar_chart'
require 'ooxml_builder/slide/insights'
require 'ooxml_builder/slide/results'
require 'ooxml_builder/slide/graph'
require 'ooxml_builder/slide/bar'
require 'ooxml_builder/workbook'

module OoxmlBuilder
  ROOT_PATH = File.expand_path("../..", __FILE__)
  TEMPLATE_PATH = "#{ROOT_PATH}/template/"
  VIEW_PATH = "#{ROOT_PATH}/lib/ooxml_builder/views/"
end
