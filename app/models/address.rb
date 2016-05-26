class Address

	attr_accessor :city, :state, :location

	def initialize

		@city = nil; @state = nil; @location = nil

	end

	def mongoize

		{:city=>@city, :state=>@state, :loc=>location.mongoize}

	end

	def self.mongoize object

		case object

			when nil then nil

			when Hash then object

			when Address then object.mongoize

		end

	end

	def self.demongoize object

		case object

			when nil then nil

			when Hash then
				address = Address.new
				if object[:city] then address.city = object[:city]
				end
				if object[:state] then address.state = object[:state]
				end
				if object[:loc] then address.location = Point.new(object[:loc][:coordinates][0],object[:loc][:coordinates][1])
				end
				address

			when Address then object

		end

	end

	def self.evolve(object)

	    case object

			when nil then nil

			when Hash then object

			when Address then object.mongoize

		end

  	end

end