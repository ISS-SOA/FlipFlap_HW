require 'minitest/autorun'
require 'minitest/rg'

require_relative 'flip_flap'

YML_DATA = File.read('data/survey.yml')
TSV_DATA = File.read('data/survey.tsv')

describe 'FlipFlap specs' do
  it 'supports tsv inputs' do
    FlipFlap.input_formats.must_include 'tsv'
  end

  it 'supports yaml inputs' do
    FlipFlap.input_formats.must_include 'yaml'
  end

  it 'should convert yml to tsv' do
    flipper = FlipFlap.new
    flipper.take_yaml(YML_DATA)
    flipper.to_tsv.must_equal TSV_DATA
  end

  it 'should convert tsv to yml' do
    flipper = FlipFlap.new
    flipper.take_tsv(TSV_DATA)
    flipper.to_yaml.must_equal YML_DATA
  end

  it 'should store Yaml in data we can retrieve' do
    flipper = FlipFlap.new
    flipper.data.must_be_nil
    flipper.take_yaml(YML_DATA)
    flipper.data.wont_be_nil
  end

  it 'should store TSV in data we can retrieve' do
    flipper = FlipFlap.new
    flipper.data.must_be_nil
    flipper.take_tsv(TSV_DATA)
    flipper.data.wont_be_nil
  end
end
