class EmployeesController < ApplicationController

def create
	@employee = Employee.new(employee_params)
    @employee.company = Company.find(params[:company_id])
    if @employee.save
       redirect_to company_path(@employee.company)
    else
      format.html{ redirect_to @company, notice: 'An error ocurred while tring to save employee'}
    end
end

def destroy
	@employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html{ redirect_to @employee.company, notice: 'Employe was succeddfully destroy.' }
      format.json {head :no_content}
    end
end

private

def employee_params
	params.require(:employee).permit(:first_name, :last_name, :email, :area_id)
end

end
