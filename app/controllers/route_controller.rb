class RouteController < ApplicationController
	before_filter :authenticate_admin!
	before_filter :authenticate_isAdmin#, :except => [:showAll, :view, :routeDetails]
	#before_filter :authenticate_company, :only => [:showAll, :view, :routeDetails], unless: :current_user_isAdmin?
	def list # for testing 
	end
	
	def new
		@route = Route.new
	end

	def showAll
		@routes = Route.all
	end

	def createRoute
		@route = Route.new(params[:route].permit(:routeName, :routeDistance, :routeSourceName, :routeDestName, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
		@route.admin_id = current_admin.id
		fieldParams = Hash.new
		fieldParams = {:routeSourceLatLong => @route.routeSourceLatLong, :routeDestLatLong => @route.routeDestLatLong}
		@route.valid?
		resultHash = Hash.new
		errorResult = @route.validateLatLong(fieldParams)
		errorResult.each do |key, value|
			@route.errors.add(key, 'Improper \'LatLong\' format')
		end
		if (@route.errors.blank?)
			@route.save
			redirect_to :action => 'showAll'
		else
			render 'new'
		end        
	end

	def view   
		@routes = Route.find(params[:id])   
	end

	def editRouteProperties
		#action to show route edit page
		# 
		@editRoute = Route.find(params[:id])
	end

	def update
		@editRoute = Route.find(params[:id])
		begin
			@editRoute.update_attributes!(params.require(:route).permit(:routeName, :routeDistance, :routeSourceName, :routeDestName, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
			redirect_to route_route_details_path(@editRoute.id)
		rescue => e
			flash[:alert] = "#{e}. Please fill the form correctly"
			redirect_to :back and return
		ensure

		end    
	end

	def destroy
		@routes = Route.find(params[:id])

		if @routes.destroy
			redirect_to route_showAll_path
		end
	end

	def routeDetails
		@route = Route.find(params[:id])
		routeBus = RouteBusstop.where(:route_id => @route.id)
		busstopIDs = Array.new
		routeBus.each do |r|
			busstopIDs << r.busstop_id
		end
		stop = Busstop.new
		@busStops = []
		busstopIDs.each do |r|
			@busStops << Busstop.find(r)
		end
	end

	def showEditRoute
		id = params[:id]
		@rel = Array.new
		@foundBusstops = Array.new
		@busstops = Busstop.all
		@routeBusstopRelations = RouteBusstop.where(:route_id => id)

		# Getting the RoutBustop Relation According to its sequence number
		@sequenceNumberOrder = @routeBusstopRelations.order(:bus_stop_sequence_number)
		
		# getting the busstop id in according to sequence number
		@sequenceNumberOrder.each do |r|
			@rel << r.busstop_id
		end

		@route = Route.find(params[:id])
		
		# Busstop of route in sequence order
		@busstopsOnRoutes = Array.new
		@rel.each do |i|
			@busstopsOnRoutes << Busstop.find(i)
		end

		@busstopsOnRoute = Array.new
		
		@busstopsOnRoute = @route.busstops # This will showing Inclunding Busstopn in Route
		
		@busstopArray = session[:busstopsIDs]
		session.delete(:busstopsIDs)
		if(@busstopArray != nil)    
			if (@busstopArray.size > 0)
				@busstopArray.each do |b|
					@foundBusstops << Busstop.find(b)
				end   
			end
		end
	end
	
	def saveBusStopOnRoute
		if not(params[:sortedRoute].blank? and params[:route_id].blank?)
			sortedRoute = Array.new
			sortedRoute = params[:sortedRoute].split(",")
			#iter = Integer.new
			iter = 0
			sequenceNumber = 1
			relations = Array.new
			testingVariable = Array.new
			sortedRoute.each do |busstop|
				#iter+=1
				rel = RouteBusstop.where(:route_id => params[:route_id], :busstop_id => busstop)
				if (rel.second.blank?)  #assert type stmt.
					rel.first.bus_stop_sequence_number = sequenceNumber
					testingVariable << sequenceNumber+=1
					if not (sortedRoute.last == busstop)
						rel.first.nextBusStop = sortedRoute[iter+1]
						#rel.first.bus_stop_sequence_number = i
						if(rel.first.valid?)
							rel.first.save
							#flash[:notice] = "Record Saved: #{rel[0].to_json}"
						else
							flash[:alert] = "RouteBusstop Object has errors. #{rel[0].errors.full_messages}"
						end
					else
						rel.first.nextBusStop = :null
						if(rel.first.valid?)
							rel.first.save
							#flash[:notice] = "Record Saved: #{rel[0].to_json}"
						else
							flash[:alert] = "RouteBusstop Object has errors. #{rel[0].errors.full_messages}"
						end
					end
				else
					flast[:alert] = "Returning Two Object"
					redirect_to back
				end
				iter+=1
				
				relations = RouteBusstop.where(:route_id => params[:route_id])
				#flash[:alert] = "relations: #{relations.to_json} <==> #{testingVariable.to_json}"
			end

			route_id = params[:route_id]         

			#flash[:alert] = relations[0].to_json
			#flash[:notice] = params[:route_id].to_s
			redirect_to :back
		end
	end
	

	def searchBusstop
		@busstops = Route.search(params[:search])
		#flash[:alert] = "#{busstops}"
		busstopsIDs = Array.new
		@busstops.each do |bus|
			busstopsIDs << bus.id 
		end
		puts "Total #{@busstops.count} Busstops Found."
		# session[:busstopsIDs] = busstopsIDs
		#redirect_to route_show_edit_route_path(params[:id])
		respond_to do |format|
			format.js {}
		end
	end

	def includeRouteBusstop
		busstop = Busstop.find(params[:busstop_id])
		route = Route.find(params[:route_id])
		route_id = params[:route_id]
		busstop_id = params[:busstop_id]
		@routeBusstopRelations = RouteBusstop.new(:route_id => route_id, :busstop_id => busstop_id)    
		if(@routeBusstopRelations.save)
			flash[:notice] = "Busstop: #{busstop.busStopName} added to route: #{route.routeName}"
			redirect_to_back()
		else
			flash[:notice] = "Could not update record."
			redirect_to_back()
		end
	end

	def removeRouteBusstop
		busstop = Busstop.find(params[:busstop_id])
		route = Route.find(params[:route_id])
		route_id = params[:route_id]
		busstop_id = params[:busstop_id]
		@routeBusstopRelations = RouteBusstop.where(:route_id => route_id, :busstop_id => busstop_id)
		if(@routeBusstopRelations.destroy_all)
			flash[:notice] = "Busstop: #{busstop.busStopName} removed from route: #{route.routeName}"
			redirect_to_back()
		else
			flash[:notice] = "Could not delete record."
			redirect_to_back()
		end
	end

end