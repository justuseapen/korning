class EmployeesController < ApplicationController
	def index
		@employees = Employee.all

		def email
			@email = employee.email.gsub"(",""
			@email = @email.gsub")",""
			@email
		end

	end

	def show
		@employee = Employee.find(params[:id])
	end
end
