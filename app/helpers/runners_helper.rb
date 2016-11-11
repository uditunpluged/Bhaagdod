module RunnersHelper
  def self.import(file)
    CSV.foreach(file.path,headers: true) do |variable|
      console.log(variable.to_hash)
      User.create! variable.to_hash
    end
  end


end
