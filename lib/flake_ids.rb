require "flake_ids/version"
require "flake_ids/generator"

module FlakeIds
  def self.generator
    Thread.current[:flake_id_generator] ||= Generator.new
  end
end
