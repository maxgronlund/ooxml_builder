require 'ooxml_builder/version'
require 'ooxml_builder/util'
require 'ooxml_builder/compression'
require 'ooxml_builder/presentation'
require 'ooxml_builder/chart/graph'
require 'ooxml_builder/chart/bar'
require 'ooxml_builder/slide/insights'
require 'ooxml_builder/slide/results'
require 'ooxml_builder/slide/graph'
require 'ooxml_builder/slide/bar'
require 'ooxml_builder/workbook'

module OoxmlBuilder
  ROOT_PATH = File.expand_path('..', __dir__)
  TEMPLATE_PATH = "#{ROOT_PATH}/template/".freeze
  VIEW_PATH = "#{ROOT_PATH}/lib/ooxml_builder/views/".freeze
  CHART_FOLDERS = [
    'ppt/charts/_rels'
  ].freeze

  SLIDE_FOLDERS = [
    'ppt/_rels',
    'ppt/charts',
    'ppt/embeddings',
    'ppt/slides/_rels',
    'pptx/ppt/charts/_rels'
  ].freeze
end
