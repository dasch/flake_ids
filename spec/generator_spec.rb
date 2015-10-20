require 'rspec'
require 'flake_ids/generator'

describe FlakeIds::Generator do
  it "generates monotonically increasing ids" do
    generator = FlakeIds::Generator.new

    id1 = generator.generate
    id2 = generator.generate

    expect(id2).to be > id1
  end
end
