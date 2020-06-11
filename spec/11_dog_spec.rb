# frozen_string_literal: true

require_relative '../lib/11_dog'
require_relative '../spec/11_shared_example_spec'

# rubocop:disable Layout/LineLength

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

describe Dog do
  subject(:toby) { described_class.new('Toby', nil, 'brown') }

  # Check out the file: 11_shared_examples_spec.rb
  # This test references that file's first test in the 'include_examples' line
  context 'when Dog is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when dog has name and color, but no breed' do
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'should have name, breed & color attributes' do
      expect(subject).to have_attributes(name: 'Toby', breed: nil, color: 'brown')
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment

describe Dog do
  # create a subject with your choice of cat name and optional breed/color
  subject(:toby) { described_class.new('Toby', nil, 'brown') } # REMOVE

  # write a test using the second shared_example to test that dog should respond to talk
  context 'when Dog has method name shared with other classes' do # REMOVE
    include_examples 'shared method name' # REMOVE
  end

  # remove the 'x' before running this test
  xit 'should like to run' do
    expect(toby.likes_to_run?).to be true # REMOVE
  end
end
# rubocop:enable Layout/LineLength