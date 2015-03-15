class Geo
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def get_info
    matrix = GoogleDistanceMatrix::Matrix.new
    from = GoogleDistanceMatrix::Place.new address: "#{@params[:from_house]} #{@params[:from_street]}, Киев, Украина"
    to = GoogleDistanceMatrix::Place.new address: "#{@params[:to_house]} #{@params[:to_street]}, Киев, Украина"

    matrix.origins << from
    matrix.destinations << to

    info = matrix.data[0][0]

    hash = {:distance => info.distance_text,
            :duration => info.duration_text,
            :cost => info.distance_text.to_f < 4 ? 30 : ((info.distance_text.to_f - 4) * 4) + 30}

    hash
  end
end
