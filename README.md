# Playground of rspec testing examples
There is a knowledge gap between reading the rspec documentation and fully understanding how to utilize this powerful tool. The idea behind this repository is to create a 'playground' of examples for TOP students to get more experience.

## Running Tests
Since this repository is full of tests, it is recommended to only run rspec tests on one individual file at at time. For example, to run the first test file from the root of this directory:

<pre><code>rpsec spec/01_string_spec.rb</code></pre>

Tip: If you have tab completion set-up, you can hit 'tab' after the first few characters of the file name.

## Set-Up
This repository already has rspec initialized & has the following line added to the .rspec file to output a more colorful and verbose test.

<pre><code>--format documentation</code></pre>
