class MovieDetailed
  attr_reader :id,
              :title, 
              :vote_average,
              :runtime,
              :summary,
              :attributes 

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @summary = attributes[:overview]
    @attributes = attributes
  end

  def genres
    @attributes[:genres].map do |genre|
       genre[:name]
    end
  end

  def cast
    @attributes[:credits][:cast].first(10).map do |member|
      member[:name] + ' as ' + member[:character]
    end
  end

  def reviews
    @attributes[:reviews][:results].map do |review|
      {author: review[:author], content: review[:content]}
    end
  end
end