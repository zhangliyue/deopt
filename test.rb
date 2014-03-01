a=["jsajbsa","sn","shjcsj","sahiach"]
 module   Enumerable
    def aaa(&block)
    d={}
      self.each do |i|
        result = block.call(i)
          (d[result]||=[])<<i
      end
    d
    end
end
b=a.aaa{ |i| i=~/j/}
p b
   


