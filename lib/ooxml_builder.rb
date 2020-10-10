require "ooxml_builder/version"
require 'ooxml_builder/util'
require 'ooxml_builder/slide/intro'
require 'ooxml_builder/slide/blank'
require 'ooxml_builder/slide/textual'
require 'ooxml_builder/slide/pictorial'
require 'ooxml_builder/slide/text_picture_split'
require 'ooxml_builder/slide/picture_description'
require 'ooxml_builder/compression'
require 'ooxml_builder/presentation'
require 'ooxml_builder/chart'


require 'ooxml_builder/slide/bar_chart'
require 'ooxml_builder/workbook'


module OoxmlBuilder
  ROOT_PATH = File.expand_path("../..", __FILE__)
  TEMPLATE_PATH = "#{ROOT_PATH}/template/"
  VIEW_PATH = "#{ROOT_PATH}/lib/ooxml_builder/views/"
end
