# © Siemens AG, 2016

require_relative '../spec_helper'

describe Cvss2 do

  let(:valid_cvss2) { CvssSuite.new('AV:N/AC:L/Au:N/C:P/I:P/A:P') }
  let(:valid_cvss2_temporal) { CvssSuite.new('AV:N/AC:L/Au:N/C:P/I:P/A:P/E:U/RL:OF/RC:C') }
  let(:valid_cvss2_environmental) { CvssSuite.new('AV:A/AC:M/Au:S/C:P/I:P/A:P/CDP:L/TD:M/CR:M/IR:M/AR:M') }
  let(:valid_cvss2_temporal_environmental) { CvssSuite.new('AV:A/AC:M/Au:S/C:P/I:P/A:P/E:POC/RL:TF/RC:UC/CDP:L/TD:M/CR:M/IR:M/AR:M') }
  let(:invalid_cvss2) { CvssSuite.new('AV:N/AC:P/C:P/AV:U/RL:OF/RC:C') }

  describe 'valid cvss2' do
    subject { valid_cvss2 }

    it_should_behave_like 'a valid cvss vector', 2, 7.5, 7.5, 7.5, 7.5
  end

  describe 'valid cvss2 with temporal' do
    subject { valid_cvss2_temporal }

    it_should_behave_like 'a valid cvss vector', 2, 7.5, 5.5, 5.5, 5.5
  end

  describe 'valid cvss2 with environmental' do
    subject { valid_cvss2_environmental }

    it_should_behave_like 'a valid cvss vector', 2, 4.9, 4.9, 4.1, 4.1
  end

  describe 'valid cvss2 with temporal and environmental' do
    subject { valid_cvss2_temporal_environmental }

    it_should_behave_like 'a valid cvss vector', 2, 4.9, 3.6, 3.2, 3.2
  end

  describe 'invalid cvss2' do
    subject { invalid_cvss2 }

    it_should_behave_like 'a invalid cvss vector with version', 2
  end
end