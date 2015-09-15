require 'calculator'

describe Calculator do
  describe '#add' do
    it 'will sum two values' do
      expect(Calculator.add(1, 2)).to eq 3
    end
  end
end
