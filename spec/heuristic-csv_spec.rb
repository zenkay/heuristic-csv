# encoding: utf-8
require 'spec_helper'
describe HeuristicCsv do
  
  describe "Heuristic behavior" do
    
    it "should parse unquoted CSV strings" do
      data = "argument1,argument2,argument3"
      CSV.heuristic_parse(data) do |row|
        row.count.should eq(3)
      end
    end

    it "should parse unquoted CSV strings with different col_sep" do
      data = "argument1;argument2;argument3"
      CSV.heuristic_parse(data, {col_sep: ";"}) do |row|
        row.count.should eq(3)
      end
    end

    it "should parse quoted CSV strings" do
      data = '"argument1","argument2","argument3"'
      CSV.heuristic_parse(data) do |row|
        row.count.should eq(3)
      end
    end
    
    it "should parse quoted CSV strings with different col_sep" do
      data = '"argument1";"argument2";"argument3"'
      CSV.heuristic_parse(data, {col_sep: ";"}) do |row|
        row.count.should eq(3)
      end
    end
    
    it "should parse CSV strings with misplaced quotes" do
      data = '"argument1","argum"WRONG"ent2","argument3"'
      CSV.heuristic_parse(data) do |row|
        row.count.should eq(3)
      end
    end
    
    it "should parse CSV strings with misplaced quotes with different col_sep" do
      data = '"argument1";"argum"WRONG"ent2";"argument3"'
      CSV.heuristic_parse(data, {col_sep: ";"}) do |row|
        row.count.should eq(3)
      end
    end
    
  end
  
end