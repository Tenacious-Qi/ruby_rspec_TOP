# frozen_string_literal: true

require_relative '../lib/16_caesar_breaker'

# rubocop:disable Metrics/BlockLength

# Let's write tests for an entire class & the included module.

# If you have watched the 'Magic Tricks of Testing' video, you will know that
# you do not have to test every single method in unit testing. Methods do not
# need to be tested if they are only sent to self or if it only sends an
# outgoing query message.
# https://youtu.be/URSWYvyc42M

# However, testing every method in this example offers good practice and
# introduces a few new concepts.

describe CaesarBreaker do
  subject(:phrase) { described_class.new('Ebiil, Tloia!') }

  # You do not need to test #initialize if it is only creating instance
  # variables. This can cause the test to be fragile, breaking anytime an
  # instance variable name is changed.

  # To test #decrypt, we will need to move 'Assert' before 'Act' again.
  # http://testing-for-beginners.rubymonstas.org/test_doubles.html
  describe '#decrypt' do
    it 'calls create_decrypted_messages' do
      allow(phrase).to receive(:save_decrypted_messages)
      expect(phrase).to receive(:create_decrypted_messages)
      phrase.decrypt
    end

    it 'calls save_decrypted_messages' do
      allow(phrase).to receive(:create_decrypted_messages)
      expect(phrase).to receive(:save_decrypted_messages)
      phrase.decrypt
    end
  end

  # ASSIGNMENT

  # Write at least one test for each of the following methods:
  describe '#create_decrypted_messages' do
  end

  describe '#translate' do
  end

  describe '#character_shift' do
    it 'shifts one letter' do
      character = 'A'
      base = 65
      shift = 1
      result = phrase.character_shift(character, base, shift)
      expect(result).to eq('B')
    end

    # ASSIGNMENT

    # Write the following test using a special character.
    xit 'does not shift non-letters' do
    end
  end

  # MODULE TESTING: There are several ways to test methods inside a module.

  # Some prefer explicitly including it in the configuration option.
  # https://relishapp.com/rspec/rspec-core/docs/helper-methods/define-helper-methods-in-a-module

  # Some prefer testing modules using a dummy class.
  # https://mixandgo.com/learn/how-to-test-ruby-modules-with-rspec

  # Modules can also be tested in a class that includes it, which is how the
  # following tests work.

  describe '#save_decrypted_messages' do
    # This method has a rescue block in case an error occurs.
    # Let's test that this method can run without raising an error.
    # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher

    context 'when it saves a file' do
      it 'does not raise an error' do
        expect { phrase.save_decrypted_messages }.not_to raise_error
      end

      # The test above outputs two lines from #display_file_location.
      # So, let stub out that method to clean up the test output.
      it 'does not raise an error' do
        allow(phrase).to receive(:display_file_location)
        expect { phrase.save_decrypted_messages }.not_to raise_error
      end
    end

    # When a method rescues an error, the method will still not raise an error.
    # Therefore, you test the conditions that happens if an error was rescued.
    context 'when rescuing an error' do
      before do
        allow(File).to receive(:open).and_raise(Errno::ENOENT)
      end

      it 'does not raise an error' do
        allow(phrase).to receive(:puts).twice
        expect { phrase.save_decrypted_messages }.not_to raise_error
      end

      it 'does not display file location' do
        expect(phrase).not_to receive(:display_file_location)
        allow(phrase).to receive(:puts).twice
        phrase.save_decrypted_messages
      end

      it 'displays error rescue message' do
        expect(phrase).to receive(:puts).twice
        phrase.save_decrypted_messages
      end
    end
  end

  # ASSIGNMENT

  # Write at least one test for each of the following methods:
  describe '#save_to_yaml' do
  end

  describe '#create_filename' do
  end

  describe '#display_file_location' do
  end
end
# rubocop:enable Metrics/BlockLength
