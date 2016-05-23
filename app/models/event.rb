class Event

	include Mongoid::Document

    field :o, as: :order, type: Integer
    field :n, as: :name, type: String
    field :d, as: :distance, type: Float
    field :u, as: :units, type: String

    embedded_in :parent, polymorphic: true, touch: true

    validates_presence_of :order
    validates_presence_of :name

    def meters

    	case self.u

    		when "miles" then self.d*1609.344
    		when "kilometers" then self.d*1000
    		when "meters" then self.d
    		when "yards" then self.d*0.9144
    		else nil

    	end

    end

    def miles

		case self.u

    		when "miles" then self.d
    		when "kilometers" then self.d*0.621371
    		when "meters" then self.d*0.000621371
    		when "yards" then self.d*0.000568182
    		else nil

    	end

    end

end
