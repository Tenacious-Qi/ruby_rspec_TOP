# frozen_string_literal: true

require_relative '../lib/11_cat'
require_relative '../spec/11_shared_example_spec'

# rubocop:disable Layout/LineLength

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

describe Cat do
  subject(:oscar) { described_class.new('Oscar', 'Maine Coon') }

  # Check out the file: 11_shared_examples_spec.rb
  # This test references that file's first test in the 'include_examples' line
  # The shared_example_spec file has further information
  context 'when Cat is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when cat has name and breed, but no color' do
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'has name, breed & color attributes' do
      expect(oscar).to have_attributes(name: 'Oscar', breed: 'Maine Coon', color: nil)
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment

describe Cat do
  # create a subject with your choice of cat name and optional breed/color
  subject(:doodle_bug) { described_class.new('Doodle Bug', 'Boston Cat') }
  # write a test using the second shared_example to test that cat should respond to talk
  context 'when method name is the same in several classes' do
    it 'responds to talk' do
      expect(doodle_bug).to respond_to(:talk)
    end
  end

  # remove the 'x' before running this test
  it 'is not hungry' do
    expect(subject.hungry?).to eq(false)
  end

  # remove the 'x' before running this test
  it 'is hiding' do
    expect(subject.hiding?).to eq(true)
  end
end
# rubocop:enable Layout/LineLength
