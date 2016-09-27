require 'minitest/autorun'
require 'minitest/rg'
require 'open3'

describe 'FlipFlap specs' do
  it 'should convert yml to tsv' do
    `ruby yml_to_tsv.rb data/survey.yml data/test.tsv`
    File.file?('data/test.tsv').must_equal true
    diff = FileUtils.compare_file('data/survey.tsv', 'data/test.tsv')
    diff.must_equal true
  end

  it 'should convert tsv to yml' do
    `ruby tsv_to_yml.rb data/survey.tsv data/test.yml`
    File.file?('data/test.yml').must_equal true
    diff = FileUtils.compare_file('data/survey.yml', 'data/test.yml')
    diff.must_equal true
  end

  after do
    `rm data/test.* > /dev/null 2>&1`
  end
end
