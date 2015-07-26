class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      icon_url = set_marker_image(company.type_of)
      marker.lat company.latitude
      marker.lng company.longitude
      marker.infowindow company.name
      marker.json({id: company.id, title: company.name, class: company.type_of })
      marker.picture({
        :url => view_context.image_path(icon_url),
        :width   => 32,
        :height  => 32
      })
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:lat, :lng, :address, :name, :type_of)
    end

    def set_marker_image(type)
      if type == "Startup"
        return 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=S|FF0000|000000'
      elsif type == "City"
        return 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=C|007FFF|000000'
      elsif type == "University"
        return 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=U|FFEB3B|000000'
      else
        return 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=?|000000|000000'
      end
    end
end
