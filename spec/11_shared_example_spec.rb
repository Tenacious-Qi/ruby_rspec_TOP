# frozen_string_literal: true

# This example has a 'Pet' class with two sub-classes 'Cat' and 'Dog'.
# There is a spec file for cat & dog (each file begins with '11_').

# In addition, there is a third spec file called '11_shared_example'.
# This file has two tests that are used in both the cat & dog spec files.

# To learn more about the use of shared examples, check out the documentation:
# https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples

# These tests are dependent on using the implicit 'subject' when they are
# included in a spec file.

RSpec.shared_examples 'base class method name' do
  # This test can be used in Cat and Dog because the method comes from the
  # base class.
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/respond-to-matcher
  context 'when method is from the base class' do
    it 'responds to meal_time' do
      expect(subject).to respond_to(:meal_time)
    end
  end
end

RSpec.shared_examples 'shared method name' do
  # This test can be used in Cat and Dog because the same method name is used
  # in both classes ('meow' or 'WOOF!').
  context 'when method name is the same in multiple classes' do
    it 'responds to talk' do
      expect(subject).to respond_to(:talk)
    end
  end
end

# For assignments see 11_cat_spec.rb or 11_dog_spec.rb - do the assignments in
# one of those files.
