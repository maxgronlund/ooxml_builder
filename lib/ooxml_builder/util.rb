# frozen_string_literal: true

module OoxmlBuilder
  # Common features
  module Util
    def pixle_to_pt(pix)
      pix * 12_700
    end

    def render_view(template_name, path, variables = {})
      view_contents = read_template(template_name)
      renderer = ERB.new(view_contents)
      b = merge_variables(binding, variables)
      data = renderer.result(b)
      File.open(path, 'w') { |f| f << data }
    end

    def require_arguments(required_argements, argements)
      raise ArgumentError unless required_argements.all? do |required_key|
        argements.keys.include? required_key
      end
    end

    def build_folders(extract_path, chart_folders)
      mkdirs(extract_path, SLIDE_FOLDERS)
      mkdirs(extract_path, CHART_FOLDERS) if chart_folders
    end

    def mkdirs(extract_path, folders)
      folders.each do |folder|
        FileUtils.mkdir_p "#{extract_path}/#{folder}"
      end
    end

    private

    def read_template(filename)
      File.read("#{OoxmlBuilder::VIEW_PATH}/#{filename}")
    end

    def copy_media(extract_path, image_path)
      image_name = File.basename(image_path)
      dest_path = "#{extract_path}/ppt/media/#{image_name}"
      FileUtils.copy_file(image_path, dest_path) unless File.exist?(dest_path)
    end

    def merge_variables(bind, variables)
      return bind if variables.empty?

      variables.each do |k, v|
        bind.local_variable_set(k, v)
      end
      bind
    end
  end
end
