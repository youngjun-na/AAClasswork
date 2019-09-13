require "TDD"


describe Array do
  describe "#my_uniq" do
    subject(:array)  {[1, 2, 2, 1, 3, 3]}
    it "should return an array" do
      expect(array.my_uniq).to be_a(Array)
    end

    it "should return an array of unique elements" do
      expect(array.my_uniq).to eq(array.uniq)
    end
  end  

  describe "#two_sum" do
    subject(:array) {[-1,0,2,-2,1]}
    it "should return a 2D Array" do
      expect(array.two_sum.all? {|sub| sub.is_a?(Array) }).to eq(true)
    end

    it "should return all pairs of positions where elements at positions sum to zero" do
      expect(array.two_sum).to eq([[0,4], [2,3]])
    end
  end

  describe "#my_transpose" do
    subject(:array) {[
    [0, 1, 2],
    [3, 4, 5]
  ]}
    it "should raise an error if receiver is not a square array" do
      expect { array.my_transpose }.to raise_error("Matrix is not a square!")
    end
    it "should do the right thing" do
      array = [[1,2,3],[4,5,6],[7,8,9]]
      expect(array.my_transpose).to eq([[1,4,7],[2,5,8],[3,6,9]])
    end
  end
end

describe "#stock_picker" do
  subject(:array) {[10, 20, 15, 25, 35, 20, 40, 30]}
  it "should return an array of length 2" do
    expect(stock_picker(array).length).to eq(2)
  end

  it "should have the later date as the second index" do
    expect(stock_picker(array)[0]).to be < stock_picker(array)[1]
  end

  it "should contain dates within the given timeframe" do
    expect(stock_picker(array).all? {|day| day.between?(0,array.length)}).to be(true)
  end

  it "should return the dates with the greatest profit margin" do
    expect(stock_picker(array)).to eq([0,6])
  end
end